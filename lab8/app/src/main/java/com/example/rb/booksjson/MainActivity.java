package com.example.rb.booksjson;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Dictionary;
import java.util.*;

/*
* Doesn't quite work. I tried using JSON data where each entry is a book, with a title, author,
* etc. Seems to be formatted differently than the Social app, and the app keeps quitting when
* I try to run it. I may try to fix it this weekend.
 */

public class MainActivity extends Activity {

    private EditText emailText;
    private TextView titleView;
    private TextView authorView;
    private ProgressBar progressBar;
    private static final String API_URL = "https://raw.githubusercontent.com/benoitvallon/100-best-books/master/books.json";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        titleView = (TextView) findViewById(R.id.titleTextView);
        authorView = (TextView) findViewById(R.id.authorTextView);
        emailText = (EditText) findViewById(R.id.emailText);
        progressBar = (ProgressBar) findViewById(R.id.progressBar);

        Button queryButton = (Button) findViewById(R.id.queryButton);
        queryButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String email = emailText.getText().toString();
                new RetrieveFeedTask().execute(email);
            }
        });
    }

    class RetrieveFeedTask extends AsyncTask<String, Void, String> {

        private Exception exception;

        //invoked on the UI thread before the task is executed
        protected void onPreExecute() {
            progressBar.setVisibility(View.VISIBLE);
            titleView.setText("");
            authorView.setText("");
        }

        //invoked on the background thread immediately after onPreExecute() finishes executing
        protected String doInBackground(String... args) {
            String email = args[0]; //email address being searched
            try {
                //create full URL for search
                URL url = new URL(API_URL);
                //create open connection to URL
                HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
                try {
                    //create an InputStreamReader with the JSON stream
                    InputStreamReader is = new InputStreamReader(urlConnection.getInputStream());
                    //convert the byte stream to a character stream using BufferedReader
                    BufferedReader bufferedReader = new BufferedReader(is);
                    StringBuilder stringBuilder = new StringBuilder();
                    String line;
                    //loop through the character stream and build a sequence of characters using StringBuilder
                    while ((line = bufferedReader.readLine()) != null) {
                        stringBuilder.append(line).append("\n");
                    }
                    bufferedReader.close();
                    //convert character sequence to a String
                    return stringBuilder.toString();
                } finally {
                    //disconnect the http connection
                    urlConnection.disconnect();
                }
            } catch (Exception e) {
                Log.e("ERROR", e.getMessage(), e);
                return null;
            }
        }

        //invoked on the UI thread after the background computation finishes
        //response is the result of doInBackground
        protected void onPostExecute(String response) {
            //response should be a String with JSON objects
            if (response == null) {
                response = "THERE WAS AN ERROR";
            }
            progressBar.setVisibility(View.GONE);
            Log.i("INFO", response);


            /*
            * Trying to print out the JSON data as lists so I can determine what the data looks
            * like.
             */
            List<String> myList = new ArrayList<String>(Arrays.asList(response.split(",")));

            for (int i = 0; i < myList.size(); i++) {
                Log.d("DICT", myList.get(i).toString());
            }

            //parse JSON object
            try {
                JSONObject object = (JSONObject) new JSONTokener(response).nextValue();
                JSONObject contact = object.getJSONObject("contactInfo");
                String name = contact.getString("fullName");
                authorView.setText(name);

                JSONArray socialprofiles = object.getJSONArray("socialProfiles");
                for (int i = 0; i < socialprofiles.length(); i++) {
                    JSONObject socialprofile = socialprofiles.getJSONObject(i);
                    String social = socialprofile.getString("type");
                    String url = socialprofile.getString("url");
                    titleView.append(social + " \t" + url + "\n");
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }

    private class DownloadImageTask extends AsyncTask<String, Void, Bitmap> {
        ImageView bmImage;

        public DownloadImageTask(ImageView bmImage) {
            this.bmImage = bmImage;
        }
        protected Bitmap doInBackground(String... urls) {
            String urldisplay = urls[0];

            Bitmap mIcon = null;
            try {
                InputStream in = new java.net.URL(urldisplay).openStream();
                //creates a bitmap from the input stream
                mIcon = BitmapFactory.decodeStream(in);
            } catch (Exception e) {
                Log.e("Error", e.getMessage());
                e.printStackTrace();
            }
            return mIcon;
        }

        protected void onPostExecute(Bitmap result) {
            bmImage.setImageBitmap(result);
        }
    }
}
