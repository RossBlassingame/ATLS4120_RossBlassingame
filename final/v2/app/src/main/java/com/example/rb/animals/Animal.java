package com.example.rb.animals;

/**
 * Created by rb on 4/6/18.
 */

public class Animal {
    private final String name;
    private final int imageResourceID;

    //constructor
    private Animal(String newname, int newID){
        this.name = newname;
        this.imageResourceID = newID;
    }

    public static final Animal[] dogs = {
            new Animal("Running", R.drawable.chihuahua),
            new Animal("Biking", R.drawable.golden),
            new Animal("Swimming", R.drawable.german),
            new Animal("Elliptical", R.drawable.basenji),
            new Animal("Stairclimber", R.drawable.chow)
    };

    public static final Animal[] flexibility = {
            new Animal("Stretching", R.drawable.chihuahua),
            new Animal("Yoga", R.drawable.golden),
            new Animal("Downward Dog", R.drawable.german),
            new Animal("Yoga class", R.drawable.basenji),
            new Animal("Rubber bands", R.drawable.chow)
    };

    public static final Animal[] strength = {
            new Animal("Bench", R.drawable.chihuahua),
            new Animal("Squat", R.drawable.golden),
            new Animal("Deadlift", R.drawable.german),
            new Animal("Curls", R.drawable.basenji),
            new Animal("Dips", R.drawable.chow)
    };

    public String getName(){
        return name;
    }

    public int getImageResourceID(){
        return imageResourceID;
    }

    //the string representation of a dog is its name
    public String toString(){
        return this.name;
    }
}
