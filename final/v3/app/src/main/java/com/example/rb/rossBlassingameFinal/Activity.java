package com.example.rb.rossBlassingameFinal;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * Created by rb on 4/2/18.
 */

public class Activity {
    private String type;
    private ArrayList<ActivityWithURL> activityList = new ArrayList<>();

    //constructor
    private Activity(String _type, ArrayList<ActivityWithURL> _activity){
        this.type = _type;
        this.activityList = new ArrayList<ActivityWithURL>(_activity);
    }

    public static final Activity[] activities = {
            new Activity("Cardio", new ArrayList<ActivityWithURL>(Arrays.asList(new ActivityWithURL("running", "google.com"), new ActivityWithURL("biking", "google.com"), new ActivityWithURL("swimming", "google.com"), new ActivityWithURL("elliptical", "google.com")))),
            new Activity("Strength", new ArrayList<ActivityWithURL>(Arrays.asList(new ActivityWithURL("bench", "google.com"), new ActivityWithURL("squat", "google.com"), new ActivityWithURL("deadlift", "google.com"), new ActivityWithURL("curls", "google.com")))),
            new Activity("Flexibility", new ArrayList<ActivityWithURL>(Arrays.asList(new ActivityWithURL("stretching", "google.com"), new ActivityWithURL("yoga", "google.com"), new ActivityWithURL("yoga class", "google.com"), new ActivityWithURL("bands", "google.com"))))
    };

    public String getType(){
        return type;
    }

    public ArrayList<ActivityWithURL> getActivityList(){
        return activityList;
    }

    public String toString(){
        return this.type;
    }

}
