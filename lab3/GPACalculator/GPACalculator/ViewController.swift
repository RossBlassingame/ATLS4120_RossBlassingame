//
//  ViewController.swift
//  GPACalculator
//
//  Created by Ross Blassingame on 9/29/17.
//  Copyright © 2017 Ross Blassingame. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var currentGPA: UITextField!
	@IBOutlet weak var currentNumberOfCredits: UITextField!
	@IBOutlet weak var class1Grade: UITextField!
	@IBOutlet weak var class1Credits: UITextField!
	@IBOutlet weak var class2Grade: UITextField!
	@IBOutlet weak var class2Credits: UITextField!
	@IBOutlet weak var class3Grade: UITextField!
	@IBOutlet weak var class3Credits: UITextField!
	@IBOutlet weak var class4Grade: UITextField!
	@IBOutlet weak var class4Credits: UITextField!
	@IBOutlet weak var class5Grade: UITextField!
	@IBOutlet weak var class5Credits: UITextField!
	@IBOutlet weak var class6Grade: UITextField!
	@IBOutlet weak var class6Credits: UITextField!
	@IBOutlet weak var class7Grade: UITextField!
	@IBOutlet weak var class7Credits: UITextField!
	
	@IBOutlet weak var resultGPA: UILabel!
	
	func calculateWeightedClassGPA(grade:String, weight:Double) -> Double {
		//var currentWeightedGPA:Double? = Double(currentGPA.text!)! + Double(currentNumberOfCredits.text!)!
		switch(grade) {
			case "A":
				return (weight * Double(4.0))
			case "A-":
				return (weight * Double(3.7))
			case "B+":
				return (weight * Double(3.3))
			case "B":
				return (weight * Double(3.0))
			case "B-":
				return (weight * Double(2.7))
			case "C+":
				return (weight * Double(2.3))
			case "C":
				return (weight * Double(2.0))
			case "C-":
				return (weight * Double(1.7))
			case "D+":
				return (weight * Double(1.3))
			case "D":
				return (weight * Double(1.0))
			case "D-":
				return (weight * Double(0.7))
			case "F":
				return Double(0.0)
			default:
				return Double(0.0)
		}
	}
	
	@IBAction func calculateGPAButton(_ sender: UIButton) {
		var resultWeightedGPA:Double = 0.0
		var totalCredits:Double = 0.0
		if (currentNumberOfCredits.text != "" && currentGPA.text != "") {
			resultWeightedGPA = Double(currentGPA.text!)! * Double(currentNumberOfCredits.text!)!
			totalCredits = Double(currentNumberOfCredits.text!)!
		}
		else {
			let alert = UIAlertController(title: "Fields Empty", message: "Please make sure you fill out both Current GPA and Total Number Of Credits.", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
				NSLog("The \"OK\" alert occured.")
			}))
			self.present(alert, animated: true, completion: nil)
		}
		if (class1Grade.text != "") {
			resultWeightedGPA = resultWeightedGPA + calculateWeightedClassGPA(grade: class1Grade.text!, weight: Double(class1Credits.text!)!)
			totalCredits = totalCredits + Double(class1Credits.text!)!
		}
		if (class2Grade.text != "") {
			resultWeightedGPA = resultWeightedGPA + calculateWeightedClassGPA(grade: class2Grade.text!, weight: Double(class2Credits.text!)!)
			totalCredits = totalCredits + Double(class2Credits.text!)!
		}
		if (class3Grade.text != "") {
			resultWeightedGPA = resultWeightedGPA + calculateWeightedClassGPA(grade: class3Grade.text!, weight: Double(class3Credits.text!)!)
			totalCredits = totalCredits + Double(class3Credits.text!)!
		}
		if (class4Grade.text != "") {
			resultWeightedGPA = resultWeightedGPA + calculateWeightedClassGPA(grade: class4Grade.text!, weight: Double(class4Credits.text!)!)
			totalCredits = totalCredits + Double(class4Credits.text!)!
		}
		if (class5Grade.text != "") {
			resultWeightedGPA = resultWeightedGPA + calculateWeightedClassGPA(grade: class5Grade.text!, weight: Double(class5Credits.text!)!)
			totalCredits = totalCredits + Double(class5Credits.text!)!
		}
		if (class6Grade.text != "") {
			resultWeightedGPA = resultWeightedGPA + calculateWeightedClassGPA(grade: class6Grade.text!, weight: Double(class6Credits.text!)!)
			totalCredits = totalCredits + Double(class6Credits.text!)!
		}
		if (class7Grade.text != "") {
			resultWeightedGPA = resultWeightedGPA + calculateWeightedClassGPA(grade: class7Grade.text!, weight: Double(class7Credits.text!)!)
			totalCredits = totalCredits + Double(class7Credits.text!)!
		}
		
		resultGPA.text = String(resultWeightedGPA/totalCredits)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.currentGPA.delegate = self as UITextFieldDelegate
		self.currentNumberOfCredits.delegate = self as UITextFieldDelegate
		self.class1Grade.delegate = self as UITextFieldDelegate
		self.class1Credits.delegate = self as UITextFieldDelegate
		self.class2Grade.delegate = self as UITextFieldDelegate
		self.class2Credits.delegate = self as UITextFieldDelegate
		self.class3Grade.delegate = self as UITextFieldDelegate
		self.class3Credits.delegate = self as UITextFieldDelegate
		self.class4Grade.delegate = self as UITextFieldDelegate
		self.class4Credits.delegate = self as UITextFieldDelegate
		self.class5Grade.delegate = self as UITextFieldDelegate
		self.class5Credits.delegate = self as UITextFieldDelegate
		self.class6Grade.delegate = self as UITextFieldDelegate
		self.class6Credits.delegate = self as UITextFieldDelegate
		self.class7Grade.delegate = self as UITextFieldDelegate
		self.class7Credits.delegate = self as UITextFieldDelegate
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		currentGPA.resignFirstResponder()
		currentNumberOfCredits.resignFirstResponder()
		class1Grade.resignFirstResponder()
		class1Credits.resignFirstResponder()
		class2Grade.resignFirstResponder()
		class2Credits.resignFirstResponder()
		class3Grade.resignFirstResponder()
		class3Credits.resignFirstResponder()
		class4Grade.resignFirstResponder()
		class4Credits.resignFirstResponder()
		class5Grade.resignFirstResponder()
		class5Credits.resignFirstResponder()
		class6Grade.resignFirstResponder()
		class6Credits.resignFirstResponder()
		class7Grade.resignFirstResponder()
		class7Credits.resignFirstResponder()
		return (true)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	
}

