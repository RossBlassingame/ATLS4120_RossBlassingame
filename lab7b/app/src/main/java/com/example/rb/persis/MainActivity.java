package com.example.rb.persis;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.content.SharedPreferences;
import android.util.Log;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Button;
import android.widget.Toast;
import android.view.View;

/*
* This app consists of an EditText and a Button. Enter your name in the EditText and hit the
* "Save!" Button to save your name. Quit the app & reload, and your name should now be the
* default text of the EditText.
 */

public class MainActivity extends AppCompatActivity {

    public static final String MY_PREFS_NAME = "persis_prefs_1";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        EditText txt = findViewById(R.id.editText);

        String name = retrievePrefs();

        if (name != null) {
            txt.setText(name, TextView.BufferType.EDITABLE);
        }
    }

    void setPrefs(String text) {
        SharedPreferences.Editor editor = getSharedPreferences(MY_PREFS_NAME, MODE_PRIVATE).edit();
        editor.putString("text", text);
        editor.apply();
    }

    String retrievePrefs() {
        SharedPreferences prefs = getSharedPreferences(MY_PREFS_NAME, MODE_PRIVATE);

        String restoredText = prefs.getString("text", null);
        return restoredText;
    }

    public void onClickBtn(View v)
    {
        EditText txt = findViewById(R.id.editText);
        String setText = txt.getText().toString();
        setPrefs(setText);
        Toast.makeText(this, "Saved! Quit the app & reload to see persistence.", Toast.LENGTH_LONG).show();
    }
}
