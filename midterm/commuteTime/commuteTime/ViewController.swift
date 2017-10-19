//
//  ViewController.swift
//  commuteTime
//
//  Created by Ross Blassingame on 10/19/17.
//  Copyright © 2017 Ross Blassingame. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
	
	@IBOutlet weak var roundTripMiles: UITextField!
	@IBOutlet weak var numberOfMins: UILabel!
	@IBOutlet weak var numberOfGallons: UILabel!
	@IBOutlet weak var currentNumberOfGallons: UILabel!
	@IBAction func calculateTimeAndGas(_ sender: UIButton) {
		if (roundTripMiles.text != "") {
			numberOfMins.text = String(((Double(roundTripMiles.text!)!)/20)*60) + " mins"
			numberOfGallons.text = String((Double(roundTripMiles.text!)!)/24) + " gallons"
		}
	}
	@IBAction func gasSliderAction(_ sender: UISlider) {
		let gallons = sender.value
		currentNumberOfGallons.text = String(format: "%.0f", gallons) + " gallons"
	}

	
	
	override func viewDidLoad() {
		// Do any additional setup after loading the view, typically from a nib.
		super.viewDidLoad()
		self.roundTripMiles.delegate = self as UITextFieldDelegate
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		roundTripMiles.resignFirstResponder()
		return (true)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

