//
//  ViewController.swift
//  CSQuestionQuiz
//
//  Created by Ross Blassingame on 10/4/17.
//  Copyright © 2017 Ross Blassingame. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	// questionDict is an empty [Int: String] dictionary
	var questionDict = [Int: [String]]()
	var counter:Int = 0
	var numberOfQuestionsCorrect:Float = 0
	var numberOfQuestionsIncorrect:Float = 0
	
	@IBOutlet weak var question: UILabel!
	@IBOutlet weak var answer1Outlet: UIButton!
	@IBAction func answer1(_ sender: UIButton) {
		// If the user's answer is correct:
		if (questionDict[counter-1]?[5] == "1") {
			numberOfQuestionsCorrect += 1
		}
		else {
			numberOfQuestionsIncorrect += 1
		}

		oneQuestion()
	}
	@IBOutlet weak var answer2Outlet: UIButton!
	@IBAction func answer2(_ sender: UIButton) {
		// If the user's answer is correct:
		if (questionDict[counter-1]?[5] == "2") {
			numberOfQuestionsCorrect += 1
		}
		else {
			numberOfQuestionsIncorrect += 1
		}
		oneQuestion()
	}
	@IBOutlet weak var answer3Outlet: UIButton!
	@IBAction func answer3(_ sender: UIButton) {
		// If the user's answer is correct:
		if (questionDict[counter-1]?[5] == "3") {
			numberOfQuestionsCorrect += 1
		}
		else {
			numberOfQuestionsIncorrect += 1
		}
		oneQuestion()
	}
	@IBOutlet weak var answer4Outlet: UIButton!
	@IBAction func answer4(_ sender: UIButton) {
		// If the user's answer is correct:
		if (questionDict[counter-1]?[5] == "4") {
			numberOfQuestionsCorrect += 1
		}
		else {
			numberOfQuestionsIncorrect += 1
		}
		oneQuestion()
	}
	@IBAction func nextQuestion(_ sender: UIButton) {
		
	}
	
	
	func oneQuestion() {
		if (questionDict[counter] != nil) {
			question.text = questionDict[counter]?[0]
			answer1Outlet.setTitle(questionDict[counter]?[1], for: .normal)
			answer2Outlet.setTitle(questionDict[counter]?[2], for: .normal)
			answer3Outlet.setTitle(questionDict[counter]?[3], for: .normal)
			answer4Outlet.setTitle(questionDict[counter]?[4], for: .normal)
			counter = counter + 1
			NSLog("Correct: \(numberOfQuestionsCorrect)");
			NSLog("Incorrect: \(numberOfQuestionsIncorrect)");
		}
		else {
			let score = ((numberOfQuestionsCorrect)/(numberOfQuestionsCorrect+numberOfQuestionsIncorrect))*100
			NSLog("Correct: \(numberOfQuestionsCorrect)");
			NSLog("Incorrect: \(numberOfQuestionsIncorrect)");
			question.text = "Game over! Your score: \(score)%.\nClick any button to play again!"
			answer1Outlet.setTitle("", for: .normal)
			answer2Outlet.setTitle("", for: .normal)
			answer3Outlet.setTitle("", for: .normal)
			answer4Outlet.setTitle("", for: .normal)
			counter = 0
			numberOfQuestionsCorrect=0
			numberOfQuestionsIncorrect = -1
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		questionDict[0] = ["In C++, how do you initialize an empty array of integers named myArray with 5 elements?", "int myArray[5];", "int myArray[4];", "myArray[5] = {1};", "myArray[5];", "1"]
		questionDict[1] = ["In C++, how do you declare an integer variable 'x' and set it to 7?", "x = (int)7;", "int x = 7;", "x = 7", "let 7 = 7", "2"]
		questionDict[2] = ["In C++: int myArray[5] = {1, 2, 3, 4, 5}. How do you access the first element of myArray?", "int myArray[1]", "myArray[0]", "myArray[1]", "myArray 1 = x", "2"]
		questionDict[3] = ["C++: What's wrong with the following for-loop syntax?\nfor (x = 200; x > 99; x--) {\n//code here\n}", "Don't put (...) around the for-loop.", "Can't do x--.", "Can't start from a big number and go smaller.", "Forgot to declare x.", "4"]
		questionDict[4] = ["How do you declare a floating point variable, x, and initialize it to 9.5?", "x=9.5;", "x=09.5;", "int x=09.50;", "float x = 9.5;", "4"]
		questionDict[5] = ["How do you loop through an array of arrays?", "One for-loop.", "Two for-loops.", "Three for-loops.", "Four for-loops.", "2"]
		
		oneQuestion()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

