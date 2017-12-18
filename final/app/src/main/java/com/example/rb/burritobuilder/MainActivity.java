package com.example.rb.burritobuilder;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.ToggleButton;

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

        final Button generateButton = (Button) findViewById(R.id.generateButton);
        generateButton.setOnClickListener(onclick);
    }

    public void generateBurrito(View view) {
        String meatOrVeggie = "";
        String tacoOrBurrito = "";
        String whereToEat = "";

        TextView burritoDetailTextView = (TextView) findViewById(R.id.burritoDetailTextView);

        //toggle button
        ToggleButton toggle = (ToggleButton) findViewById(R.id.meatVeggieToggle);
        boolean toggleLocation = toggle.isChecked();

        //spinner
        Spinner exercise = (Spinner) findViewById(R.id.spinner);
        String location = String.valueOf(exercise.getSelectedItem());

        //radio buttons
        RadioGroup cost = (RadioGroup) findViewById(R.id.radioGroup);
        int cost_id = cost.getCheckedRadioButtonId();



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
            case "29th Street":
                whereToEat = "29th Street";
            case "Pearl Street":
                whereToEat = "Pearl Street";
        }

        burritoDetailTextView.setText("You've chosen a " + meatOrVeggie + " " + tacoOrBurrito + ". You should eat it at " + whereToEat + ".");
    }
}
