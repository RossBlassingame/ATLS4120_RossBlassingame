package com.example.rb.burritobuilder;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.ToggleButton;
import android.widget.Switch;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                generateBurrito(view);
            }
        };
        View.OnClickListener onclick1 = new View.OnClickListener(){
            public void onClick(View view){
                viewInNewWindow(view);
            }
        };

        final Button generateButton = (Button) findViewById(R.id.generateButton);
        final Button viewInNewWindowButton = (Button) findViewById(R.id.viewRestaurantInSeparateWindowButton);
        generateButton.setOnClickListener(onclick);
        viewInNewWindowButton.setOnClickListener(onclick1);
    }

    public void viewInNewWindow(View view) {
        String restaurant = "";

        //spinner
        Spinner exercise = (Spinner) findViewById(R.id.spinner);
        String location = String.valueOf(exercise.getSelectedItem());

        // Get location
        switch (location) {
            case "The Hill":
                restaurant = "Illegal Pete's";
                break;
            case "29th Street":
                restaurant = "Chipotle";
                break;
            case "Pearl Street":
                restaurant = "Bartaco";
                break;
        }

        Intent intent = new Intent(this, ResultPageActivity.class);
        intent.putExtra("result", restaurant);

        startActivity(intent);
    }

    public void generateBurrito(View view) {
        String meatOrVeggie = "";
        String tacoOrBurrito = "";
        String whereToEat = "";
        String restaurant = "";
        String salsaText = "";
        String guacText = "";
        String sourCreamText = "";
        String cheeseText = "";
        String isGlutenFree = "";

        TextView burritoDetailTextView = (TextView) findViewById(R.id.burritoDetailTextView);

        //check boxes
        CheckBox cheeseCheckBox = (CheckBox) findViewById(R.id.cheeseCheckBox);
        Boolean cheese = cheeseCheckBox.isChecked();

        CheckBox sourCreamCheckBox = (CheckBox) findViewById(R.id.sourCreamCheckBox);
        Boolean sourCream = sourCreamCheckBox.isChecked();

        CheckBox salsaCheckBox = (CheckBox) findViewById(R.id.salsaCheckBox);
        Boolean salsa = salsaCheckBox.isChecked();

        CheckBox guacCheckBox = (CheckBox) findViewById(R.id.guacCheckBox);
        Boolean guac = guacCheckBox.isChecked();

        //toggle button
        ToggleButton toggle = (ToggleButton) findViewById(R.id.meatVeggieToggle);
        boolean toggleLocation = toggle.isChecked();

        //spinner
        Spinner loc = (Spinner) findViewById(R.id.spinner);
        String location = String.valueOf(loc.getSelectedItem());

        //radio buttons
        RadioGroup cost = (RadioGroup) findViewById(R.id.radioGroup);
        int cost_id = cost.getCheckedRadioButtonId();

        // switch
        Switch gluten = (Switch) findViewById(R.id.switch1);
        boolean glutenFree = gluten.isChecked();

        // Check taco vs. burrito
        //Veggie
        if (cost_id == R.id.tacoButton) {
            tacoOrBurrito = "taco";
        }
        // Meat
        else {
            tacoOrBurrito = "burrito";
        }

        // Meat vs. veggie
        if (toggleLocation) {
            meatOrVeggie = "meat";
        }
        else {
            meatOrVeggie = "veggie";
        }

        // Get location
        switch (location) {
            case "The Hill":
                whereToEat = "The Hill";
                restaurant = "Illegal Pete's";
                break;
            case "29th Street":
                whereToEat = "29th Street";
                restaurant = "Chipotle";
                break;
            case "Pearl Street":
                whereToEat = "Pearl Street";
                restaurant = "Bartaco";
                break;
        }

        // Get toppings
        if (salsa) {
            salsaText = " salsa ";
        }
        if (sourCream) {
            sourCreamText = " sourCream ";
        }
        if (guac) {
            guacText = " guac ";
        }
        if (cheese) {
            cheeseText = " cheese ";
        }

        // gluten free
        if (glutenFree) {
            isGlutenFree = "Since you're gluten free, you should use a corn tortilla.";
        }

        burritoDetailTextView.setText("You've chosen a " + meatOrVeggie + " " + tacoOrBurrito +
                " with the following toppings: " + salsaText + sourCreamText + guacText +
                cheeseText + "." + "\n" + isGlutenFree + "\nSince you want to eat it near "
                + whereToEat + ", you should go to " + restaurant + ".");
    }
}
