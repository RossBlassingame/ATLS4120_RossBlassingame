package com.example.rb.lab6dogs;

/**
 * Created by rb on 4/4/18.
 */

import android.app.Fragment;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;


/**
 * A simple {@link Fragment} subclass.
 */
public class TypeListFragment extends Fragment implements AdapterView.OnItemClickListener{


    public TypeListFragment() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_type_list, container, false);
    }

    @Override
    public void onStart(){
        super.onStart();
        View view = getView();
        if (view != null){
            //load data into fragment
            //get the list view
            ListView listtype = (ListView) view.findViewById(R.id.listView);
            //define an array adapter
            ArrayAdapter<Animal> listAdapter = new ArrayAdapter<Animal>(getActivity(), android.R.layout.simple_list_item_1, Animal.ANIMALS);
            //set the array adapter on the list view
            listtype.setAdapter(listAdapter);
            //attach the listener to the listview
            listtype.setOnItemClickListener(this);
        }
    }

    //create interface
    interface TypeListListener {
        void itemClicked(long id);
    }

    //create listener
    private TypeListListener listener;

    @Override public void onAttach(Context context){
        super.onAttach(context);
        //attaches the context to the listener
        listener = (TypeListListener) context;
    }

    @Override public void onItemClick(AdapterView<?> parent, View view, int position, long id){
        if (listener != null){
            //tells the listener an item was clicked
            listener.itemClicked(id);
        }
    }

}