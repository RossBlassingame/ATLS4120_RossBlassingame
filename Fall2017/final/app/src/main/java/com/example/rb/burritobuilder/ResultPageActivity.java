package com.example.rb.burritobuilder;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

/**
 * Created by rb on 12/17/17.
 */

public class ResultPageActivity extends AppCompatActivity {
    private String result;
    private String googleSearchURL;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.resultpage);

        //get intent
        Intent intent = getIntent();
        result = intent.getStringExtra("result");
        googleSearchURL = "http://google.com/search?q=" + result;

        //update text view
        TextView messageView = (TextView) findViewById(R.id.resultTextView);
        messageView.setText(result+"");

        //get image button
        final Button googleButton = (Button) findViewById(R.id.searchGoogleButton);
        //create listener
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                loadWebSite(view);
            }
        };

        //add listener to the button
        googleButton.setOnClickListener(onclick);

    }

    public void loadWebSite(View view){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(googleSearchURL));
        startActivity(intent);
    }
}
