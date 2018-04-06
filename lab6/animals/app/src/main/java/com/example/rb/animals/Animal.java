package com.example.rb.animals;

/**
 * Created by rb on 4/6/18.
 */

public class Animal {
    private String name;
    private int imageResourceID;

    //constructor
    private Animal(String newname, int newID){
        this.name = newname;
        this.imageResourceID = newID;
    }

    public static final Animal[] dogs = {
            new Animal("Chihuahua", R.drawable.chihuahua),
            new Animal("Golden Retriever", R.drawable.golden),
            new Animal("German Shepherd", R.drawable.german),
            new Animal("Basenji", R.drawable.basenji),
            new Animal("Chow Chow", R.drawable.chow)
    };

    public String getName(){
        return name;
    }

    public int getImageResourceID(){
        return imageResourceID;
    }

    //the string representation of a tulip is its name
    public String toString(){
        return this.name;
    }
}
