//
//  NewWordViewController.swift
//  SimpleTable
//
//  Created by Ross Blassingame on 2/19/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import UIKit
import os.log

class NewWordViewController: ViewController, UITextFieldDelegate {

	@IBOutlet weak var newNameField: UITextField!
	@IBOutlet weak var saveButton: UIBarButtonItem!
	
	var word: String?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		newNameField.delegate = self

		updateSaveButtonState()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
		super.prepare(for: segue, sender: sender)
		
		// Configure the destination view controller only when the save button is pressed.
		guard let button = sender as? UIBarButtonItem, button === saveButton else {
			os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
			return
		}
		
		word = newNameField.text
    }
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		self.view.endEditing(true)
		return true
	}
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		saveButton.isEnabled = false
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		updateSaveButtonState()
		navigationItem.title = textField.text
	}
	
	private func updateSaveButtonState() {
		// Disable the Save button if the text field is empty.
		let text = newNameField.text ?? ""
		saveButton.isEnabled = !text.isEmpty
	}

}
