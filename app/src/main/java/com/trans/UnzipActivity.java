package com.trans;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.widget.TextView;
import android.widget.Toast;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * Extracts files.zip from assets to external files dir on first launch.
 * Uses a cached zip on disk + ZipFile random access (one pass, large buffers).
 */
public class UnzipActivity extends Activity {

    private static final String PREFS = "data";
    private static final String KEY_FIRST = "first";
    private static final String CACHE_ZIP = "files.zip";
    private static final String PROBE_REL = "music/crazydave.ogg";
    private static final int IO_BUFFER = 256 * 1024;
    private static final long UI_THROTTLE_MS = 120L;

    private Handler handler;
    private TextView progressTextView;
    private long lastUiUpdateMs;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        progressTextView = new TextView(this);
        progressTextView.setTextSize(16f);
        progressTextView.setText("Preparing game data...");
        progressTextView.setGravity(android.view.Gravity.CENTER);
        setContentView(progressTextView);

        handler = new Handler(Looper.getMainLooper(), msg -> {
            updateProgress(msg.arg1, msg.arg2);
            return true;
        });

        SharedPreferences prefs = getSharedPreferences(PREFS, MODE_PRIVATE);
        if (!prefs.getBoolean(KEY_FIRST, true) || isGameDataPresent()) {
            if (isGameDataPresent()) {
                prefs.edit().putBoolean(KEY_FIRST, false).apply();
            }
            launchGame();
            return;
        }

        Toast.makeText(this, "Extracting game data (first run)...", Toast.LENGTH_SHORT).show();
        new Thread(() -> extractFilesZip(prefs)).start();
    }

    private boolean isGameDataPresent() {
        File probe = new File(getExternalFilesDir(null), PROBE_REL);
        return probe.isFile() && probe.length() > 0L;
    }

    private void updateProgress(int current, int total) {
        if (total <= 0) {
            progressTextView.setText("Extracting... " + current + " files");
        } else {
            progressTextView.setText("Extracting: " + current + " / " + total);
        }
    }

    private void postProgressThrottled(int current, int total) {
        long now = System.currentTimeMillis();
        if (now - lastUiUpdateMs < UI_THROTTLE_MS && current < total) {
            return;
        }
        lastUiUpdateMs = now;
        handler.sendMessage(handler.obtainMessage(0, current, total));
    }

    private File cachedZipFile() {
        return new File(getCacheDir(), CACHE_ZIP);
    }

    /** Copy asset zip to cache once (sequential read, large buffer). */
    private boolean copyAssetZipToCache(File dest) throws Exception {
        File parent = dest.getParentFile();
        if (parent != null && !parent.exists() && !parent.mkdirs()) {
            return false;
        }
        try (InputStream in = new BufferedInputStream(getAssets().open(CACHE_ZIP), IO_BUFFER);
             OutputStream out = new BufferedOutputStream(new FileOutputStream(dest), IO_BUFFER)) {
            byte[] buf = new byte[IO_BUFFER];
            int n;
            while ((n = in.read(buf)) != -1) {
                out.write(buf, 0, n);
            }
            out.flush();
        }
        return dest.isFile() && dest.length() > 0L;
    }

    private void extractFilesZip(SharedPreferences prefs) {
        File extRoot = getExternalFilesDir(null);
        if (extRoot == null) {
            finishWithError();
            return;
        }

        try {
            File cacheZip = cachedZipFile();
            if (!cacheZip.isFile() || cacheZip.length() == 0L) {
                postProgressThrottled(0, 1);
                if (!copyAssetZipToCache(cacheZip)) {
                    finishWithError();
                    return;
                }
            }

            try (ZipFile zip = new ZipFile(cacheZip)) {
                Enumeration<? extends ZipEntry> en = zip.entries();
                int total = 0;
                while (en.hasMoreElements()) {
                    total++;
                    en.nextElement();
                }

                int index = 0;
                Enumeration<? extends ZipEntry> again = zip.entries();
                byte[] buf = new byte[IO_BUFFER];
                while (again.hasMoreElements()) {
                    ZipEntry entry = again.nextElement();
                    index++;
                    String name = entry.getName();
                    if (entry.isDirectory()) {
                        new File(extRoot, name).mkdirs();
                    } else {
                        File outFile = new File(extRoot, name);
                        File parent = outFile.getParentFile();
                        if (parent != null && !parent.exists()) {
                            parent.mkdirs();
                        }
                        try (InputStream in = new BufferedInputStream(zip.getInputStream(entry), IO_BUFFER);
                             OutputStream out = new BufferedOutputStream(new FileOutputStream(outFile), IO_BUFFER)) {
                            int len;
                            while ((len = in.read(buf)) != -1) {
                                out.write(buf, 0, len);
                            }
                        }
                    }
                    postProgressThrottled(index, total);
                }
            }

            if (!isGameDataPresent()) {
                finishWithError();
                return;
            }

            prefs.edit().putBoolean(KEY_FIRST, false).apply();
            runOnUiThread(() -> {
                Toast.makeText(this, "Extract complete", Toast.LENGTH_SHORT).show();
                launchGame();
            });
        } catch (Exception e) {
            e.printStackTrace();
            finishWithError();
        }
    }

    private void launchGame() {
        startActivity(new Intent(this, com.trans.pvz.GameLauncher.class));
        finish();
    }

    private void finishWithError() {
        runOnUiThread(() -> {
            Toast.makeText(this, "Extract failed — need assets/files.zip in APK", Toast.LENGTH_LONG).show();
            finish();
        });
    }
}
