package com.example.rb.animals;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ImageView;
import android.widget.TextView;

/**
 * Created by rb on 4/6/18.
 */

public class AnimalActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_animal);

        //get animal id from the intent
        int animalnum = (Integer)getIntent().getExtras().get("animalid");
        Animal beast = Animal.dogs[animalnum];

        //populate image
        ImageView animalImage = findViewById(R.id.animalImageView);
        animalImage.setImageResource(beast.getImageResourceID());

        //populate name
        TextView animalName = findViewById(R.id.animal_name);
        animalName.setText(beast.getName());
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
