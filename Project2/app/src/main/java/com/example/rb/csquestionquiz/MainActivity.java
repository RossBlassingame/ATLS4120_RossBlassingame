package com.example.rb.csquestionquiz;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final Button answerButton1 = (Button) findViewById(R.id.button1);
        final Button answerButton2 = (Button) findViewById(R.id.button2);
        final Button answerButton3 = (Button) findViewById(R.id.button3);
        final Button answerButton4 = (Button) findViewById(R.id.button4);
        TextView questionText = (TextView) findViewById(R.id.questionText);

        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                parseUserAnswer(view);
            }
        };
    }

    public void parseUserAnswer(View view) {
        switch (view.getId()) {
            case R.id.button1:
                determineIfAnswerIsCorrect(view.getId());
            case R.id.button2:
                break;
            case R.id.button3:
                break;
            case R.id.button4:
                break;
            default:
                break;
        }
    }

    public void determineIfAnswerIsCorrect(int id) {
        final Button button = (Button) findViewById(id);
    }

}
