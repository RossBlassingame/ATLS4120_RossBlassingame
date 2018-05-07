package com.example.rb.rossBlassingameFinal;

import android.app.FragmentTransaction;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

/*
AILEEN - PLEASE READ

Here's what I've implemented:
1. a, b, c, d, e
2. (add)
3. (delete)
4. (open related website)
5. (persistent using SharedPreferences)
7. (fragments)

For some reason lists don't update immediately so you must go out/back in to see changes
(add/delete)
 */

public class MainActivity extends android.app.Activity implements TypeListFragment.UniverseListListener, ActivityDetailFragment.ButtonClickListener {

    public static final String MY_PREFS_NAME = "persis_prefs_3";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    }

    @Override public void itemClicked(long id){
        //create new fragment instance
        ActivityDetailFragment frag = new ActivityDetailFragment();
        //set the id of the universe selected
        frag.setUniverse(id);

        //create new fragment transaction
        FragmentTransaction ft = getFragmentManager().beginTransaction();
        //replace the fragment in the fragment container
        ft.replace(R.id.fragment_container, frag);
        //add fragment to the back stack
        ft.addToBackStack(null);
        //set the transition animation-optional
        ft.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE);
        //commit the transaction
        ft.commit();
    }

    @Override public void onBackPressed() {
        if (getFragmentManager().getBackStackEntryCount() > 0 ){
            getFragmentManager().popBackStack();
        } else {
            super.onBackPressed();
        }
    }

    @Override public void addheroclicked(View view){
        ActivityDetailFragment fragment = (ActivityDetailFragment)getFragmentManager().findFragmentById(R.id.fragment_container);
        fragment.addhero();
    }

    public void yoloOnClick(View view) {
        Uri uri = Uri.parse("http://www.google.com"); // missing 'http://' will cause crashed
        Intent intent = new Intent(Intent.ACTION_VIEW, uri);
        startActivity(intent);
    }











    List<ActivityWithURL> retrievePrefs(String type) {
        SharedPreferences prefs = getSharedPreferences(MY_PREFS_NAME, MODE_PRIVATE);

        String restoredText = prefs.getString(type, null);

        Type gsonType = new TypeToken< List < ActivityWithURL >>() {}.getType();
        List < ActivityWithURL > actitiesWithURLs = new Gson().fromJson(restoredText, gsonType);


        return actitiesWithURLs;
    }

    void setPrefs(String type, ArrayList<ActivityWithURL> activities) {

        String JSONstring = new Gson().toJson(activities);

        SharedPreferences.Editor editor = getSharedPreferences(MY_PREFS_NAME, MODE_PRIVATE).edit();
        editor.putString(type, JSONstring);
        editor.apply();
    }

}
