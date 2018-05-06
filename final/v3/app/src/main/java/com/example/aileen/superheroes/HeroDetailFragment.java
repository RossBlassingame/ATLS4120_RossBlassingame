package com.example.aileen.superheroes;


import android.app.AlertDialog;
import android.app.Fragment;
import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


/**
 * A simple {@link Fragment} subclass.
 */
public class HeroDetailFragment extends Fragment implements View.OnClickListener {

    public static final String MY_PREFS_NAME = "persis_prefs_1";

    // array adapter
    private ArrayAdapter<String> adapter;

    //id of the universe chosen
    private long universeId;

    public HeroDetailFragment() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        if (savedInstanceState !=null){
            universeId = savedInstanceState.getLong("universeId");
        }
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_hero_detail, container, false);
    }

    @Override public void onStart(){
        super.onStart();

        View view = getView();
        ListView listHeroes = (ListView) view.findViewById(R.id.herolistView);

        // get hero data
        List<String> herolist = new ArrayList<String>();

        herolist = retrievePrefs(Activity.activities[(int) universeId].getType());
        //herolist = Activity.activities[(int) universeId].getActivityList();

        Log.i("ROSS", herolist.toString());

        if (herolist.isEmpty() || herolist == null) {
            herolist = Activity.activities[(int) universeId].getActivityList();
        }

        //set array adapter
        adapter = new ArrayAdapter<String>(getActivity(), android.R.layout.simple_list_item_1, herolist);

        //bind array adapter to the list view
        listHeroes.setAdapter(adapter);

        Button addHeroButton = (Button) view.findViewById(R.id.addHeroButton);
        addHeroButton.setOnClickListener(this);

        //register context menu
        registerForContextMenu(listHeroes);

    }

    //set the universe id
    public void setUniverse(long id){
        this.universeId = id;
    }

    @Override public void onSaveInstanceState(Bundle savedInstanceState){
        savedInstanceState.putLong("universeId", universeId);
    }

    //create interface
    interface ButtonClickListener{
        void addheroclicked(View view);
    }

    //create listener
    private ButtonClickListener listener;

    @Override public void onAttach(Context context){
        super.onAttach(context);
        //attaches the context to the listener
        listener = (ButtonClickListener)context;
    }

    @Override public void onClick(View view){
        if (listener !=null){
            listener.addheroclicked(view);
        }
    }

    public void addhero(){
        //create alert dialog
        AlertDialog.Builder dialog = new AlertDialog.Builder(getActivity());

        //create edit text
        final EditText edittext = new EditText(getActivity());

        //add edit text to dialog
        dialog.setView(edittext);

        //set dialog title
        dialog.setTitle("Add Activity");

        //sets OK action
        dialog.setPositiveButton("Add", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int whichButton) {
                //get hero name entered
                String heroName = edittext.getText().toString();
                if(!heroName.isEmpty()){
                    // add hero
                    Activity.activities[(int) universeId].getActivityList().add(heroName);
                    // persist activities
                    setPrefs(Activity.activities[(int) universeId].getType(), Activity.activities[(int) universeId].getActivityList());
                    //refresh the list view
                    HeroDetailFragment.this.adapter.notifyDataSetChanged();
                }
            }
        });

        //sets cancel action
        dialog.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int whichButton) {
                // cancel
            }
        });

        //present alert dialog
        dialog.show();
    }

    @Override public void onCreateContextMenu(ContextMenu menu, View view, ContextMenu.ContextMenuInfo menuInfo){
        super.onCreateContextMenu(menu, view, menuInfo);
        //cast ContextMenu.ContextMenuInfo to AdapterView.AdapterContextMenuInfo since we're using an adapter
        AdapterView.AdapterContextMenuInfo adapterContextMenuInfo = (AdapterView.AdapterContextMenuInfo) menuInfo;
        //get hero name that was pressed
        String heroname = adapter.getItem(adapterContextMenuInfo.position);
        //set the menu title
        menu.setHeaderTitle("Delete " + heroname);
        //add the choices to the menu
        menu.add(1, 1, 1, "Yes");
        menu.add(2, 2, 2, "No");
    }

    @Override public boolean onContextItemSelected(MenuItem item){
        //get the id of the item
        int itemId = item.getItemId();
        if (itemId == 1) { //if yes menu item was pressed
            //get the position of the menu item
            AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();
            //remove the hero
            Activity.activities[(int) universeId].getActivityList().remove(info.position);
            //refresh the list view
            HeroDetailFragment.this.adapter.notifyDataSetChanged();
        }
        return true;
    }



















    List<String> retrievePrefs(String type) {
        SharedPreferences prefs = getActivity().getSharedPreferences(MY_PREFS_NAME, getActivity().MODE_PRIVATE);

        Set<String> restoredText = prefs.getStringSet(type, null);

        List<String> retItems = new ArrayList<String>();

        if (restoredText != null) {
            retItems.addAll(restoredText);
        }

        return retItems;
    }

    void setPrefs(String type, ArrayList<String> text) {
        Set<String> itemSet = new HashSet<>();
        itemSet.addAll(text);

        SharedPreferences.Editor editor = getActivity().getSharedPreferences(MY_PREFS_NAME, getActivity().MODE_PRIVATE).edit();
        editor.putStringSet(type, itemSet);
        editor.apply();
    }

}
