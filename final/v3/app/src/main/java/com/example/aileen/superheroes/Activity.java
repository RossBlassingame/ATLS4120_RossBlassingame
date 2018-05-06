package com.example.aileen.superheroes;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * Created by aileen on 4/2/18.
 */

public class Activity {
    private String type;
    private ArrayList<String> activityList = new ArrayList<>();

    //constructor
    private Activity(String _type, ArrayList<String> _activity){
        this.type = _type;
        this.activityList = new ArrayList<String>(_activity);
    }

    public static final Activity[] activities = {
            new Activity("Cardio", new ArrayList<String>(Arrays.asList("running", "biking", "swimming", "elliptical"))),
            new Activity("Strength", new ArrayList<String>(Arrays.asList("bench", "squat", "deadlift", "curls"))),
            new Activity("Flexibility", new ArrayList<String>(Arrays.asList("yoga", "bands", "stretching")))
    };

    public String getType(){
        return type;
    }

    public ArrayList<String> getActivityList(){
        return activityList;
    }

    public String toString(){
        return this.type;
    }

}
