package com.example.rb.animals;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

/**
 * Created by rb on 4/6/18.
 */

public class AnimalCategoryActivity extends ListActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Intent i = getIntent();
        String animaltype = i.getStringExtra("animaltype");

        //get the list view
        ListView listAnimals = getListView();

        //define an array adapter
        ArrayAdapter<Animal> listAdapter;

        //initialize the array adapter with the right list of animals
        switch (animaltype){
            case "Dogs":
                listAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, Animal.dogs);
                break;
            default: listAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, Animal.dogs);
        }

        //set the array adapter on the list view
        listAnimals.setAdapter(listAdapter);
    }

    @Override
    public void onListItemClick(ListView listView, View view, int position, long id){
        Intent intent = new Intent(AnimalCategoryActivity.this, AnimalActivity.class);
        intent.putExtra("animalid", (int) id);
        startActivity(intent);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        //inflate menu to add items to the action bar
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        //get the ID of the item on the action bar that was clicked
        switch (item.getItemId()) {
            case R.id.create_order:
                //start order activity
                Intent intent = new Intent(this, OrderActivity.class);
                startActivity(intent);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

}
