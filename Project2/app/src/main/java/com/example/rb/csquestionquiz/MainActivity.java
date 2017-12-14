package com.example.rb.csquestionquiz;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import java.util.*;

public class MainActivity extends AppCompatActivity {

    Map<String, String[]> questionMap = new HashMap<String, String[]>();
    int totalScore = 0;
    int key = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                switch (view.getId()) {
                    case R.id.button1:
                        parseUserAnswer(view, 1);
                    case R.id.button2:
                        parseUserAnswer(view, 2);
                    case R.id.button3:
                        parseUserAnswer(view, 3);
                    case R.id.button4:
                        parseUserAnswer(view, 4);
                    default:
                        break;
                }
            }
        };

        addQuestionsToMap();

        final Button answerButton1 = (Button) findViewById(R.id.button1);
        final Button answerButton2 = (Button) findViewById(R.id.button2);
        final Button answerButton3 = (Button) findViewById(R.id.button3);
        final Button answerButton4 = (Button) findViewById(R.id.button4);
        TextView questionText = (TextView) findViewById(R.id.questionText);

        answerButton1.setOnClickListener(onclick);
        answerButton2.setOnClickListener(onclick);
        answerButton3.setOnClickListener(onclick);
        answerButton4.setOnClickListener(onclick);



    }

    public void parseUserAnswer(View view, int buttonNumber) {

        int correctAnswer = 0;
        Log.i("key", String.valueOf(key));
        if (questionMap.containsKey(String.valueOf(key))) {
            correctAnswer = Integer.parseInt(questionMap.get(String.valueOf(key))[5]);

            // Correct answer.
            if (correctAnswer == buttonNumber) {
                // User answer is correct.
                totalScore++;
                updateText();
            }
            // Wrong answer.
            else {
                updateText();
            }
        }
        else {
            updateText();
        }
    }

    public void updateText() {
        final Button answerButton1 = (Button) findViewById(R.id.button1);
        final Button answerButton2 = (Button) findViewById(R.id.button2);
        final Button answerButton3 = (Button) findViewById(R.id.button3);
        final Button answerButton4 = (Button) findViewById(R.id.button4);
        TextView questionText = (TextView) findViewById(R.id.questionText);

        if (questionMap.containsKey(String.valueOf(key))) {
            String[] answerArray = questionMap.get(String.valueOf(key));
            String question = answerArray[0];
            questionText.setText(question);
            answerButton1.setText(answerArray[1]);
            answerButton2.setText(answerArray[2]);
            answerButton3.setText(answerArray[3]);
            answerButton4.setText(answerArray[4]);
        }
        else {
            questionText.setText("Game over! Your score: " + totalScore + " out of 5. Press any button to play again.");
        }
    }

    public void addQuestionsToMap() {
        String q1 = "In Python, how do you create a new Integer named 'x', and set it equal to 5?";
        String a1_1 = "int x = 5;";
        String a1_2 = "int x = 5";
        String a1_3 = "x = 5;";
        String a1_4 = "x = 5";
        String[] a1Array = {q1, a1_1, a1_2, a1_3, a1_4, "4"};
        questionMap.put("0", a1Array);

        String q2 = "In C++, how do you create a new Integer named 'x', and set it equal to 5?";
        String a2_1 = "int x = 5;";
        String a2_2 = "Integer x = 5;";
        String a2_3 = "x = 5;";
        String a2_4 = "int x = 5";
        String[] a2Array = {q2, a2_1, a2_2, a2_3, a2_4, "1"};
        questionMap.put("1", a2Array);

        String q3 = "In Java, how do you create a new Integer named 'x', and set it equal to 5?";
        String a3_1 = "x = (int) 5;";
        String a3_2 = "integer x = (int) 5;";
        String a3_3 = "int x = 5;";
        String a3_4 = "x = 5;";
        String[] a3Array = {q3, a3_1, a3_2, a3_3, a3_4, "3"};
        questionMap.put("2", a3Array);

        String q4 = "In Python, how do you create a new function named 'f' with the parameter 'a'?";
        String a4_1 = "def f(a) { ... }";
        String a4_2 = "def f() {a: ...}";
        String a4_3 = "def f(a):";
        String a4_4 = "def f(): {a} ...";
        String[] a4Array = {q4, a4_1, a4_2, a4_3, a4_4, "3"};
        questionMap.put("3", a4Array);

        String q5 = "In Python, how do you create a new class named 'C'?";
        String a5_1 = "C = (class)";
        String a5_2 = "class C:";
        String a5_3 = "class C = new Class";
        String a5_4 = "C = new Class";
        String[] a5Array = {q5, a5_1, a5_2, a5_3, a5_4, "2"};
        questionMap.put("4", a5Array);


    }

    public void determineIfAnswerIsCorrect(int id) {
        final Button button = (Button) findViewById(id);
    }

}
