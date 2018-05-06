package com.example.rb.rossBlassingameFinal;


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
public class UniverseListFragment extends Fragment implements AdapterView.OnItemClickListener{


    public UniverseListFragment() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_universe_list, container, false);
    }

    @Override
    public void onStart(){
        super.onStart();
        View view = getView();
        if (view != null){
            //load data into fragment
            //get the list view
            ListView listUniverse = (ListView) view.findViewById(R.id.listView);
            //define an array adapter
            ArrayAdapter<Activity> listAdapter = new ArrayAdapter<Activity>(getActivity(), android.R.layout.simple_list_item_1, Activity.activities);
            //set the array adapter on the list view
            listUniverse.setAdapter(listAdapter);
            //attach the listener to the listview
            listUniverse.setOnItemClickListener(this);
        }
    }

    //create interface
    interface UniverseListListener{
        void itemClicked(long id);
    }

    //create listener
    private UniverseListListener listener;

    @Override public void onAttach(Context context){
        super.onAttach(context);
        //attaches the context to the listener
        listener = (UniverseListListener) context;
    }

   @Override public void onItemClick(AdapterView<?> parent, View view, int position, long id){
        if (listener != null){
            //tells the listener an item was clicked
            listener.itemClicked(id);
        }
    }

}