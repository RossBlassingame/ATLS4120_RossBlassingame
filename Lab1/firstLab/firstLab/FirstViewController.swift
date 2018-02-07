//
//  FirstViewController.swift
//  firstLab
//
//  Created by Ross Blassingame on 2/6/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

	@IBOutlet weak var myPicker: UIPickerView!
	@IBOutlet weak var moodLabel: UILabel!
	
	let genMoodComponent = 0
	let detMoodComponent = 1
	
	var moodMood = [String: [String]]()
	var genMood = [String]()
	var detMood = [String]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if let pathURL = Bundle.main.url(forResource: "moods", withExtension: "plist"){
			//creates a property list decoder object
			let plistdecoder = PropertyListDecoder()
			do {
				let data = try Data(contentsOf: pathURL)
				moodMood = try plistdecoder.decode([String: [String]].self, from: data)
				genMood = Array(moodMood.keys)
				detMood = moodMood[genMood[0]]! as [String]
			}
			catch {
				print(error)
			}
		}
	}
	
	//Methods to implement the picker
	//Required for the UIPickerViewDataSource protocol
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 2
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		if component == genMoodComponent {
			return genMood.count
		} else {
			return detMood.count
		}
	}
	
	//Picker Delegate methods
	//returns the title for the row
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		if component == genMoodComponent {
			return genMood[row]
		} else {
			return detMood[row]
		}
	}
	
	//Called when a row is selected
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		//checks which component was picked
		if component == genMoodComponent {
			let selectedMood = genMood[row] //gets the selected artist
			detMood = moodMood[selectedMood]! //gets the albums for the selected artist
			myPicker.reloadComponent(detMoodComponent) //reload the album component
			myPicker.selectRow(0, inComponent: detMoodComponent, animated: true) //set the album component back to 0
		}
		let artistrow = pickerView.selectedRow(inComponent: genMoodComponent) //gets the selected row for the artist
		let albumrow = pickerView.selectedRow(inComponent: detMoodComponent) //gets the selected row for the album
		moodLabel.text = "You feel \(genMood[artistrow]) - \(detMood[albumrow])"
	}


	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

