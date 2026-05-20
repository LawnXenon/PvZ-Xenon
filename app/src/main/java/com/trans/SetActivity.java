package com.trans;

import com.trans.pvz.R;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.graphics.drawable.ColorDrawable;
import android.os.Build;
import android.os.Bundle;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.NumberPicker;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

/**
 * Extra settings screen for PvZ TV.
 */
public class SetActivity extends Activity {

    private static final int REQ_IMPORT_SAVE = 0x63;
    private static final int REQ_EXPORT_SAVE = 0x42;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.ICE_CREAM_SANDWICH) {
            setTheme(android.R.style.Theme_Holo_Light);
        }
        if (getWindow() != null) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                getWindow().setNavigationBarContrastEnforced(false);
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                getWindow().setStatusBarColor(0);
                getWindow().setNavigationBarColor(0);
            }
        }
        if (getActionBar() != null) {
            getActionBar().setBackgroundDrawable(new ColorDrawable(0));
        }
        setTitle(R.string.settings_title);

        SharedPreferences prefs = getSharedPreferences("data", MODE_PRIVATE);

        ScrollView scroll = new ScrollView(this);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        int pad = (int) (16 * getResources().getDisplayMetrics().density);
        root.setPadding(pad, pad, pad, pad);

        TextView intro = new TextView(this);
        intro.setGravity(Gravity.CENTER);
        intro.setText(R.string.settings_intro);
        intro.setTextSize(16f);

        CheckBox fullscreen = new CheckBox(this);
        fullscreen.setText(R.string.settings_fullscreen);
        fullscreen.setTextSize(16f);
        fullscreen.setChecked(!prefs.getBoolean("shiLiuBiJiu", true));

        LinearLayout aspectRow = new LinearLayout(this);
        aspectRow.setOrientation(LinearLayout.HORIZONTAL);
        LinearLayout.LayoutParams aspectParams = new LinearLayout.LayoutParams(
                0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f);
        NumberPicker widthPicker = new NumberPicker(this);
        widthPicker.setMinValue(1);
        widthPicker.setMaxValue(20);
        widthPicker.setValue(prefs.getInt("width", 16));
        widthPicker.setLayoutParams(aspectParams);
        NumberPicker heightPicker = new NumberPicker(this);
        heightPicker.setMinValue(1);
        heightPicker.setMaxValue(20);
        heightPicker.setValue(prefs.getInt("height", 9));
        heightPicker.setLayoutParams(aspectParams);
        aspectRow.addView(widthPicker);
        aspectRow.addView(heightPicker);
        aspectRow.setVisibility(fullscreen.isChecked() ? View.GONE : View.VISIBLE);
        fullscreen.setOnCheckedChangeListener((buttonView, isChecked) ->
                aspectRow.setVisibility(isChecked ? View.GONE : View.VISIBLE));

        Button saveAspect = new Button(this);
        saveAspect.setText(R.string.settings_save_aspect);
        saveAspect.setOnClickListener(v -> {
            prefs.edit()
                    .putInt("width", widthPicker.getValue())
                    .putInt("height", heightPicker.getValue())
                    .putBoolean("shiLiuBiJiu", !fullscreen.isChecked())
                    .apply();
            Toast.makeText(this, R.string.settings_saved, Toast.LENGTH_SHORT).show();
        });

        Button importSave = new Button(this);
        importSave.setText(R.string.settings_import_save);
        importSave.setOnClickListener(v -> {
            Toast.makeText(this, R.string.settings_pick_zip, Toast.LENGTH_SHORT).show();
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType("application/zip");
            startActivityForResult(intent, REQ_IMPORT_SAVE);
        });

        Button restoreBackup = new Button(this);
        restoreBackup.setText(R.string.settings_restore_backup);
        restoreBackup.setOnClickListener(v ->
                Toast.makeText(this, R.string.settings_restore_todo, Toast.LENGTH_SHORT).show());

        CheckBox autoBackup = new CheckBox(this);
        autoBackup.setText(R.string.settings_auto_backup);
        autoBackup.setChecked(prefs.getBoolean("autoBackUp", true));
        autoBackup.setOnCheckedChangeListener((buttonView, isChecked) ->
                prefs.edit().putBoolean("autoBackUp", isChecked).apply());

        Button importFullSave = new Button(this);
        importFullSave.setText(R.string.settings_import_full_save);
        importFullSave.setOnLongClickListener(v -> {
            Toast.makeText(this, R.string.settings_import_full_hint, Toast.LENGTH_SHORT).show();
            return true;
        });

        Button exportSave = new Button(this);
        exportSave.setText(R.string.settings_export_save);
        exportSave.setOnClickListener(v -> {
            Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType("application/zip");
            intent.putExtra(Intent.EXTRA_TITLE, getString(R.string.settings_export_filename));
            startActivityForResult(intent, REQ_EXPORT_SAVE);
        });

        root.addView(intro);
        root.addView(fullscreen);
        root.addView(aspectRow);
        root.addView(saveAspect);
        root.addView(importSave);
        root.addView(restoreBackup);
        root.addView(autoBackup);
        root.addView(importFullSave);
        root.addView(exportSave);
        scroll.addView(root);
        setContentView(scroll);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        menu.add(0, 1, 0, R.string.settings_hide_icon).setCheckable(true);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == 1) {
            try {
                PackageManager pm = getPackageManager();
                ComponentName entrance = new ComponentName(this, SetActivityEntrance.class);
                int state = pm.getComponentEnabledSetting(entrance);
                int newState = (state == PackageManager.COMPONENT_ENABLED_STATE_DISABLED)
                        ? PackageManager.COMPONENT_ENABLED_STATE_ENABLED
                        : PackageManager.COMPONENT_ENABLED_STATE_DISABLED;
                pm.setComponentEnabledSetting(entrance, newState, PackageManager.DONT_KILL_APP);
                item.setChecked(newState == PackageManager.COMPONENT_ENABLED_STATE_DISABLED);
            } catch (Exception e) {
                Toast.makeText(this, e.getMessage(), Toast.LENGTH_SHORT).show();
            }
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode == RESULT_OK && data != null) {
            Toast.makeText(this, R.string.settings_operation_done, Toast.LENGTH_SHORT).show();
        }
    }
}
