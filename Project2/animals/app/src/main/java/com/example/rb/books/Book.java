package com.example.rb.books;
import java.util.List;
import java.util.ArrayList;

/**
 * Created by rb on 4/6/18.
 */

public class Book {
    private final String name;

    List<Book> books = new ArrayList<Book>();

    //constructor
    private Book(String newname){
        this.name = newname;
    }

    /*
    public Book[] books = {
            new Book("War and Peace"),
            new Book("Harry Potter"),
            new Book("Game of Thrones"),
            new Book("Catch 22"),
            new Book("Animal Farm")
    };
    */

    public String getName(){
        return name;
    }

    public void addBook(String title) {
        books.add(new Book(title));
    }


    //the string representation of a dog is its name
    public String toString(){
        return this.name;
    }
}
