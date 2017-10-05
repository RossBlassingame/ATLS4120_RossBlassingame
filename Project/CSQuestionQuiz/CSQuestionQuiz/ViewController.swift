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
	
	@IBOutlet weak var question: UILabel!
	@IBOutlet weak var answer1: UIButton!
	@IBOutlet weak var answer2: UIButton!
	@IBOutlet weak var answer3: UIButton!
	@IBOutlet weak var answer4: UIButton!
	
	func oneQuestion() {
		question.text = questionDict[counter]?[0]
		answer1.setTitle(questionDict[counter]?[1], for: .normal)
		answer2.setTitle(questionDict[counter]?[2], for: .normal)
		answer3.setTitle(questionDict[counter]?[3], for: .normal)
		answer4.setTitle(questionDict[counter]?[4], for: .normal)
		counter = counter + 1
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		questionDict[0] = ["In C++, how do you initialize an empty array of integers named myArray with 5 elements?", "int myArray[5];", "int myArray[4];", "myArray[5] = {1};", "myArray[5];", "1"]
		
		oneQuestion()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

