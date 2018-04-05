package com.example.rb.lab6dogs;

import android.app.AlertDialog;
import android.app.Fragment;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
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

/**
 * Created by rb on 4/4/18.
 */

public class AnimalDetailFragment extends Fragment implements View.OnClickListener {

    // array adapter
    private ArrayAdapter<String> adapter;

    //id of the type chosen
    private long typeID;

    public AnimalDetailFragment() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        if (savedInstanceState !=null){
            typeID = savedInstanceState.getLong("typeID");
        }
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_animal_detail, container, false);
    }

    @Override public void onStart(){
        super.onStart();

        View view = getView();
        ListView listBreeds = view.findViewById(R.id.breedlistView);

        // get animal data
        ArrayList<String> breedList = new ArrayList<String>();
        breedList = Animal.ANIMALS[(int) typeID].getAnimals();

        //set array adapter
        adapter = new ArrayAdapter<String>(getActivity(), android.R.layout.simple_list_item_1, breedList);

        //bind array adapter to the list view
        listBreeds.setAdapter(adapter);

        Button addAnimalButton = view.findViewById(R.id.addAnimalButton);
        addAnimalButton.setOnClickListener(this);

        //register context menu
        registerForContextMenu(listBreeds);

    }

    //set the type id
    public void setType(long id){
        this.typeID = id;
    }

    @Override public void onSaveInstanceState(Bundle savedInstanceState){
        savedInstanceState.putLong("typeID", typeID);
    }

    //create interface
    interface ButtonClickListener{
        void addAnimalClicked(View view);
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
            listener.addAnimalClicked(view);
        }
    }

    public void addAnimal(){
        //create alert dialog
        AlertDialog.Builder dialog = new AlertDialog.Builder(getActivity());

        //create edit text
        final EditText edittext = new EditText(getActivity());

        //add edit text to dialog
        dialog.setView(edittext);

        //set dialog title
        dialog.setTitle("Add Animal");

        //sets OK action
        dialog.setPositiveButton("Add", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int whichButton) {
                //get animal name entered
                String animalName = edittext.getText().toString();
                if(!animalName.isEmpty()){
                    // add animal
                    Animal.ANIMALS[(int) typeID].getAnimals().add(animalName);
                    //refresh the list view
                    AnimalDetailFragment.this.adapter.notifyDataSetChanged();
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
        //get animal name that was pressed
        String animalName = adapter.getItem(adapterContextMenuInfo.position);
        //set the menu title
        menu.setHeaderTitle("Delete " + animalName);
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
            //remove the animal
            Animal.ANIMALS[(int) typeID].getAnimals().remove(info.position);
            //refresh the list view
            AnimalDetailFragment.this.adapter.notifyDataSetChanged();
        }
        return true;
    }

}