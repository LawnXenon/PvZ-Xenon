package com.trans;

import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.regex.Pattern;

/**
 * ACPManager — Asset Content Pack manager used by native code via JNI.
 * Must match the original APK API (including RawData inner class).
 */
public class ACPManager {
    private static final int STREAM_BUFFER_SIZE = 0x19000;

    private static final ACPManager mInst = new ACPManager();

    private AssetManager mAssets;
    private String mPrefix = "";
    private boolean mFileMapReady;
    private final HashMap<String, String> mFileMap = new HashMap<>();
    private RawData mBuffer;
    private InputStream mStream;
    private String mFilename;

    /** Required by JNI — fields must keep these names. */
    public static class RawData {
        public byte[] data;
        public int length;

        public RawData() {}
    }

    private ACPManager() {}

    public static ACPManager getInstance() {
        return mInst;
    }

    public void setAssets(AssetManager assets, String prefix) {
        mAssets = assets;
        mPrefix = prefix;
        mFileMapReady = false;
        mFileMap.clear();
    }

    public synchronized void loadFileMap() {
        if (mAssets != null && mPrefix != null && !mFileMapReady) {
            setupFileMap(mAssets, mPrefix);
        }
    }

    public void setupFileMap(AssetManager assets, String prefix) {
        synchronized (mFileMap) {
            mFileMapReady = true;
            ArrayList<String> files = new ArrayList<>();
            listdir(assets, files, prefix);
            for (String path : files) {
                String key = path.toLowerCase(Locale.US);
                mFileMap.put(key, path);
            }
        }
    }

    private boolean listdir(AssetManager assets, ArrayList<String> out, String path) {
        try {
            String[] list = assets.list(path);
            if (list == null) {
                return false;
            }
            boolean found = false;
            for (String name : list) {
                String full = path + name;
                if (isFile(assets, full)) {
                    out.add(full);
                    found = true;
                } else if (listdir(assets, out, full + "/")) {
                    found = true;
                }
            }
            return found;
        } catch (IOException e) {
            return false;
        }
    }

    private boolean isFile(AssetManager assets, String path) {
        try {
            InputStream in = assets.open(path);
            in.close();
            return true;
        } catch (IOException e) {
            return false;
        }
    }

    public String canonicalPath(String path) {
        String[] parts = path.split(Pattern.quote(File.separator));
        if (parts.length < 3) {
            return path;
        }
        String result = parts[parts.length - 1];
        for (int i = parts.length - 2; i >= 0; i--) {
            if ("..".equals(parts[i]) && i > 0) {
                i--;
                continue;
            }
            if (parts[i].length() > 0 && !".".equals(parts[i])) {
                result = parts[i] + File.separator + result;
            }
        }
        return result;
    }

    public String getFileName(String path) {
        String canonical = canonicalPath(path);
        String key = (mPrefix + canonical).toLowerCase(Locale.US);
        synchronized (mFileMap) {
            if (mFileMap.containsKey(key)) {
                return mFileMap.get(key);
            }
        }
        return mPrefix + canonical;
    }

    public boolean hasFile(String path) {
        loadFileMap();
        InputStream in = null;
        try {
            in = mAssets.open(getFileName(path));
            return in != null;
        } catch (IOException e) {
            return false;
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                }
            }
        }
    }

    public int getFileSize(String path) {
        InputStream in = null;
        try {
            in = mAssets.open(getFileName(path));
            return in.available();
        } catch (IOException e) {
            return 0;
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException ignored) {}
            }
        }
    }

    public AssetFileDescriptor openFd(String path) {
        android.util.Log.d("ACPManager", "openFd: " + path);
        try {
            return mAssets.openFd(getFileName(path));
        } catch (IOException e) {
            android.util.Log.e("ACPManager", "openFd failed: " + path);
            return null;
        }
    }

    public void beginStream(String path) throws Exception {
        android.util.Log.d("ACPManager", "beginStream: " + path);
        if (mStream != null) {
            throw new Exception("beginStream called while another stream is still open");
        }
        mFilename = getFileName(path);
        try {
            mStream = mAssets.open(mFilename);
            if (mStream != null && mBuffer == null) {
                mBuffer = new RawData();
                mBuffer.data = new byte[STREAM_BUFFER_SIZE];
            }
        } catch (IOException ignored) {
        }
    }

    public void endStream() {
        if (mStream != null) {
            try {
                mStream.close();
            } catch (IOException ignored) {
            }
            mStream = null;
        }
    }

    public RawData readStream() {
        if (mStream == null) {
            return null;
        }
        try {
            int available = mStream.available();
            if (available > STREAM_BUFFER_SIZE) {
                available = STREAM_BUFFER_SIZE;
            }
            int read = mStream.read(mBuffer.data, 0, available);
            mBuffer.length = read;
        } catch (IOException ignored) {
        }
        return mBuffer;
    }

    public long skip(int bytes) {
        if (mStream == null) return 0;
        try {
            return mStream.skip(bytes);
        } catch (IOException e) {
            return 0;
        }
    }
}
