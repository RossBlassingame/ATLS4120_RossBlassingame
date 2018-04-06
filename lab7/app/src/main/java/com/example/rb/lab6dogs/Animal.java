package com.example.rb.lab6dogs;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * Created by rb on 4/4/18.
 */

public class Animal {
    private String type;
    private ArrayList<String> breed = new ArrayList<>();

    //constructor
    private Animal(String typ, ArrayList<String> breeds){
        this.type = typ;
        this.breed = new ArrayList<String>(breeds);
    }

    public static final Animal[] ANIMALS = {
            new Animal("Dogs", new ArrayList<String>(Arrays.asList("Golden Retriever", "German Shepherd", "Chihuahua", "Basenji", "Husky", "Chow Chow"))),
            new Animal("Cats", new ArrayList<String>(Arrays.asList("Siamese", "Persian", "Ragdoll", "Bengal", "Sphynx", "Maine Coon")))
    };

    public String gettype(){
        return type;
    }

    public ArrayList<String> getAnimals(){
        return breed;
    }

    public String toString(){
        return this.type;
    }

}