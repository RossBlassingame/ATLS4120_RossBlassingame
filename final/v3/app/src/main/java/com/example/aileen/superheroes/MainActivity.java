package com.example.aileen.superheroes;

import android.app.FragmentTransaction;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class MainActivity extends android.app.Activity implements UniverseListFragment.UniverseListListener, HeroDetailFragment.ButtonClickListener {

    public static final String MY_PREFS_NAME = "persis_prefs_1";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    }

    @Override public void itemClicked(long id){
        //create new fragment instance
        HeroDetailFragment frag = new HeroDetailFragment();
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
        HeroDetailFragment fragment = (HeroDetailFragment)getFragmentManager().findFragmentById(R.id.fragment_container);
        fragment.addhero();
    }












    List<String> retrievePrefs() {
        SharedPreferences prefs = getSharedPreferences(MY_PREFS_NAME, MODE_PRIVATE);

        Set<String> restoredText = prefs.getStringSet("text", null);

        List<String> retItems = new ArrayList<String>();

        if (restoredText != null) {
            retItems.addAll(restoredText);
        }

        return retItems;
    }

    void setPrefs(ArrayList<String> text) {
        Set<String> itemSet = new HashSet<>();
        itemSet.addAll(text);

        SharedPreferences.Editor editor = getSharedPreferences(MY_PREFS_NAME, MODE_PRIVATE).edit();
        editor.putStringSet("text", itemSet);
        editor.apply();
    }

}
