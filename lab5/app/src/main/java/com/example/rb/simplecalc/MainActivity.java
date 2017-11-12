package com.example.rb.simplecalc;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;
import android.content.Context;
import android.widget.Toast;

import static com.example.rb.simplecalc.R.id.txtNumber;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //get button
        final Button buttonAddOne = (Button) findViewById(R.id.btnAddOne);
        final Button buttonAddTwo = (Button) findViewById(R.id.btnAddTwo);
        final Button buttonAddThree = (Button) findViewById(R.id.btnAddThree);
        final Button buttonTimesZero = (Button) findViewById(R.id.btnTimesZero);
        final Button buttonTimesTwo = (Button) findViewById(R.id.btnTimesTwo);
        final Button buttonTimesThree = (Button) findViewById(R.id.btnTimesThree);
        //create listener
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                updateButton(view);
            }
        };
        //add listener to the button
        buttonAddOne.setOnClickListener(onclick);
        buttonAddTwo.setOnClickListener(onclick);
        buttonAddThree.setOnClickListener(onclick);
        buttonTimesZero.setOnClickListener(onclick);
        buttonTimesTwo.setOnClickListener(onclick);
        buttonTimesThree.setOnClickListener(onclick);
    }


    public void updateButton(View view){
        TextView numView = (TextView) findViewById(R.id.txtNumber);
        Integer num = Integer.parseInt(numView.getText().toString());
        if (view.getId() == R.id.btnAddOne) {
            num += 1;
            makeToast("+", 1);
        }
        else if (view.getId() == R.id.btnAddTwo) {
            num += 2;
            makeToast("+", 2);
        }
        else if (view.getId() == R.id.btnAddThree) {
            num += 3;
            makeToast("+", 3);
        }
        else if (view.getId() == R.id.btnTimesZero) {
            num = 0;
            makeToast("*", 0);
        }
        else if (view.getId() == R.id.btnTimesTwo) {
            num *= 2;
            makeToast("*", 2);
        }
        else if (view.getId() == R.id.btnTimesThree) {
            num *= 3;
            makeToast("*", 3);
        }
        else {
            num = 999;
        }

        numView.setText(num+"");
    }

    public void makeToast(String op, Integer num) {
        Context context = getApplicationContext();
        String opText = "";
        if (op == "+") {
            opText = "Added ";
        }
        else if (op == "*") {
            opText = "Multiplied by ";
        }
        int duration = Toast.LENGTH_SHORT;

        String text = opText + num.toString();

        Toast toast = Toast.makeText(context, text, duration);
        toast.show();
    }
}
