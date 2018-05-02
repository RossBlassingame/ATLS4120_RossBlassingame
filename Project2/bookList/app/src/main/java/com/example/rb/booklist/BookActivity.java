package com.example.rb.booklist;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import android.view.View;


public class BookActivity extends Activity {

    public static final String MY_PREFS_NAME = "persis_prefs_1";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_book);

        Intent i = getIntent();
        String bookTitle = i.getStringExtra("bookTitle");

        TextView title = findViewById(R.id.bookTitle);
        title.setText(bookTitle.toString());

        EditText notes = findViewById(R.id.editText_bookNotes);

        Log.i("BOOKTITLE:", bookTitle.toString());

        String oldNotes = retrievePrefs(bookTitle.toString());
        if (oldNotes != null) {
            Log.i("OLDNOTES NOT NULL:", oldNotes);
            notes.setText(oldNotes.toString());
        }
        else {
            Log.i("ROSS", "IN ELSE");
        }
    }

    String retrievePrefs(String title) {
        SharedPreferences prefs = getSharedPreferences(MY_PREFS_NAME, MODE_PRIVATE);

        String restoredText = prefs.getString(title.toString(), null);

        return restoredText;
    }

    void setPrefs(String text, String title) {
        SharedPreferences.Editor editor = getSharedPreferences(MY_PREFS_NAME, MODE_PRIVATE).edit();
        Log.i("IN SETPREFS:", title + ": " + text);
        editor.putString(title.toString(), text);
        editor.apply();
    }

    public void onClickBtn(View v)
    {
        EditText txt = findViewById(R.id.editText_bookNotes);
        TextView title = findViewById(R.id.bookTitle);
        String setText = txt.getText().toString();
        setPrefs(setText, title.getText().toString());
        Toast.makeText(this, "Saved! Quit the app & reload to see persistence.", Toast.LENGTH_LONG).show();
    }


}