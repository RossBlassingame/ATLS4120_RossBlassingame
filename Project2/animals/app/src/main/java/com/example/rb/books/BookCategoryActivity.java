package com.example.rb.books;

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

public class BookCategoryActivity extends ListActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Intent i = getIntent();
        String booktype = i.getStringExtra("booktype");

        //get the list view
        ListView listBooks = getListView();

        //define an array adapter
        ArrayAdapter<Book> listAdapter;

        //initialize the array adapter with the right list of books
        switch (booktype){
            case "Dogs":
                listAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, Book.books);
                break;
            default: listAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, Book.books);
        }

        //set the array adapter on the list view
        listBooks.setAdapter(listAdapter);
    }

    @Override
    public void onListItemClick(ListView listView, View view, int position, long id){
        Intent intent = new Intent(BookCategoryActivity.this, BookActivity.class);
        intent.putExtra("bookid", (int) id);
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
