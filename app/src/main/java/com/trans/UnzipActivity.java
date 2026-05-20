package com.trans;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * UnzipActivity — extracts files.zip from assets on first launch.
 */
public class UnzipActivity extends Activity {

    private Handler handler;
    private TextView progressTextView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        progressTextView = new TextView(this);
        progressTextView.setTextSize(16f);
        progressTextView.setText("\u51c6\u5907\u89e3\u538b\u6570\u636e\u5305...");
        progressTextView.setGravity(android.view.Gravity.CENTER);
        setContentView(progressTextView);
        Toast.makeText(this, "\u89e3\u538b\u6570\u636e\u5305\u5f00\u59cb!", Toast.LENGTH_SHORT).show();

        handler = new Handler(Looper.getMainLooper(), msg -> {
            updateProgress(msg.arg1, msg.arg2);
            return true;
        });

        new Thread(this::extractFilesZip).start();
    }

    private void updateProgress(int current, int total) {
        progressTextView.setText("\u89e3\u538b\u8fdb\u5ea6: " + current + "/" + total);
    }

    private void extractFilesZip() {
        SharedPreferences prefs = getSharedPreferences("data", MODE_PRIVATE);
        int totalSize = 0;
        int written = 0;

        try (InputStream raw = getAssets().open("files.zip");
             ZipInputStream zis = new ZipInputStream(raw)) {
            ZipEntry entry;
            while ((entry = zis.getNextEntry()) != null) {
                totalSize += (int) entry.getSize();
            }
        } catch (Exception e) {
            e.printStackTrace();
            finishWithError(prefs);
            return;
        }

        byte[] buffer = new byte[1024];
        try (InputStream raw = getAssets().open("files.zip");
             ZipInputStream zis = new ZipInputStream(raw)) {
            ZipEntry entry;
            while ((entry = zis.getNextEntry()) != null) {
                String name = entry.getName();
                if (entry.isDirectory()) {
                    File dir = new File(getExternalFilesDir(null), name);
                    dir.mkdirs();
                } else {
                    File outFile = new File(getExternalFilesDir(null), name);
                    File parent = outFile.getParentFile();
                    if (parent != null && !parent.exists()) {
                        parent.mkdirs();
                    }
                    try (FileOutputStream fos = new FileOutputStream(outFile)) {
                        int len;
                        while ((len = zis.read(buffer)) != -1) {
                            fos.write(buffer, 0, len);
                            written += len;
                            int current = written;
                            int total = totalSize > 0 ? totalSize : written;
                            handler.sendMessage(handler.obtainMessage(0, current, total));
                        }
                    }
                    zis.closeEntry();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            finishWithError(prefs);
            return;
        }

        prefs.edit().putBoolean("first", false).apply();
        runOnUiThread(() -> {
            Toast.makeText(this, "\u89e3\u538b\u5b8c\u6210!", Toast.LENGTH_SHORT).show();
            startActivity(new Intent(this, com.trans.pvz.GameLauncher.class));
            finish();
        });
    }

    private void finishWithError(SharedPreferences prefs) {
        // Keep first=true so the next launch retries extraction.
        runOnUiThread(() -> {
            Toast.makeText(this, "Extract failed — check assets/files.zip in the APK", Toast.LENGTH_LONG).show();
            finish();
        });
    }
}
