package com.example.aileen.superheroes;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * Created by aileen on 4/2/18.
 */

public class Hero {
    private String universe;
    private ArrayList<String> superheroes = new ArrayList<>();

    //constructor
    private Hero(String univ, ArrayList<String> heroes){
        this.universe = univ;
        this.superheroes = new ArrayList<String>(heroes);
    }

    public static final Hero[] heroes = {
            new Hero("Cardio", new ArrayList<String>(Arrays.asList("running", "biking", "swimming", "elliptical"))),
            new Hero("Strength", new ArrayList<String>(Arrays.asList("bench", "squat", "deadlift", "curls"))),
            new Hero("Flexibility", new ArrayList<String>(Arrays.asList("yoga", "bands", "stretching")))
    };

    public String getUniverse(){
        return universe;
    }

    public ArrayList<String> getSuperheroes(){
        return superheroes;
    }

    public String toString(){
        return this.universe;
    }

}
