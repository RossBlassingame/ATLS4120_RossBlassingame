package com.example.rb.booklist;
import android.util.Log;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import android.widget.ListView;
import android.widget.Button;
import android.view.View;
import android.content.SharedPreferences;
import java.util.List;
import java.util.HashSet;
import java.util.Set;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;


/*
* NEXT STEPS:
* - when a title/row is clicked, delete it from the list
 */

public class MainActivity extends AppCompatActivity {

    public static final String MY_PREFS_NAME = "persis_prefs_1";

    ArrayAdapter<String> adapter;
    EditText editText;
    ArrayList<String> itemList;
    protected void onCreate(Bundle savedInstanceState) {

        List<String> tmpItems = retrievePrefs();
        if (tmpItems != null) {
            Log.i("ROSS", tmpItems.toString());
            itemList = new ArrayList<String>();
            itemList.addAll(tmpItems);
        }
        else {
            String[] items={"Harry Potter","Game of Thrones","Catch 22"};
            itemList=new ArrayList<String>(Arrays.asList(items));
        }

        Log.i("ROSS", "Below ELSE");


        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        adapter=new ArrayAdapter<String>(this, R.layout.list, R.id.txtitem, itemList);
        ListView listV=(ListView)findViewById(R.id.listView);
        editText=(EditText)findViewById(R.id.editText);
        Button btAdd=(Button)findViewById(R.id.addButton);

        listV.setAdapter(adapter);

        btAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String newItem = editText.getText().toString();
                // add new item to arraylist
                itemList.add(newItem);
                // notify listview of data changed
                adapter.notifyDataSetChanged();

                setPrefs(itemList);
            }
        });
    }

    List<String> retrievePrefs() {
        SharedPreferences prefs = getSharedPreferences(MY_PREFS_NAME, MODE_PRIVATE);

        Set<String> restoredText = prefs.getStringSet("text", null);

        List<String> retItems = new ArrayList<String>();
        retItems.addAll(restoredText);

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
