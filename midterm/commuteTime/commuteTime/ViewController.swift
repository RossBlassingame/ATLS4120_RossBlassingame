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

