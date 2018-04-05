package com.example.rb.lab6dogs;

import android.app.Activity;
import android.app.FragmentTransaction;
import android.os.Bundle;
import android.view.View;

public class MainActivity extends Activity implements TypeListFragment.TypeListListener, AnimalDetailFragment.ButtonClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    @Override public void itemClicked(long id){
        //create new fragment instance
        AnimalDetailFragment frag = new AnimalDetailFragment();
        //set the id of the type selected
        frag.setType(id);

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

    @Override public void addAnimalClicked(View view){
        AnimalDetailFragment fragment = (AnimalDetailFragment)getFragmentManager().findFragmentById(R.id.fragment_container);
        fragment.addAnimal();
    }

}
