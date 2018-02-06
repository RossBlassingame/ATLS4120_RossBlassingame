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
	@IBOutlet weak var monthlySwitch: UISwitch!
	@IBOutlet weak var carBikeBusSegmentedControl: UISegmentedControl!
	@IBOutlet weak var vehicleImage: UIImageView!
	
	@IBAction func calculateTimeAndGas(_ sender: UIButton) {
		if (roundTripMiles.text != "") {
			if ((Double(roundTripMiles.text!)!) > 50) {
				let alert = UIAlertController(title: "Over 50 Miles", message: "You're going over 50 miles!", preferredStyle: .alert)
				alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
					NSLog("The \"OK\" alert occured.")
				}))
				self.present(alert, animated: true, completion: nil)
			}
			numberOfMins.text = String(((Double(roundTripMiles.text!)!)/20)*60) + " mins"
			numberOfGallons.text = String((Double(roundTripMiles.text!)!)/24) + " gallons"
		}
	}
	@IBAction func gasSliderAction(_ sender: UISlider) {
		let gallons = sender.value
		currentNumberOfGallons.text = String(format: "%.0f", gallons) + " gallons"
	}
	
	func updateMonthlyVsDaily() {
		if (monthlySwitch.isOn) {
			numberOfMins.text = String((((Double(roundTripMiles.text!)!)/20)*60)*20) + " mins"
			numberOfGallons.text = String(((Double(roundTripMiles.text!)!)/24)*20) + " gallons"
		}
		else  {
			numberOfMins.text = String(((Double(roundTripMiles.text!)!)/20)*60) + " mins"
			numberOfGallons.text = String((Double(roundTripMiles.text!)!)/24) + " gallons"
		}
	}
	@IBAction func monthlySwitchFlipped(_ sender: UISwitch) {
		updateCommuteAndGasFromSegControl()
	}
	
	func updateCommuteAndGasFromSegControl() {
		if (carBikeBusSegmentedControl.selectedSegmentIndex == 0) {
			if (monthlySwitch.isOn) {
				numberOfMins.text = String((((Double(roundTripMiles.text!)!)/20)*20)*60) + " mins"
				numberOfGallons.text = String(((Double(roundTripMiles.text!)!)/24)*20) + " gallons"
				vehicleImage.image = UIImage(named: "car_icon")
			}
			else {
				numberOfMins.text = String(((Double(roundTripMiles.text!)!)/20)*60) + " mins"
				numberOfGallons.text = String((Double(roundTripMiles.text!)!)/24) + " gallons"
				vehicleImage.image = UIImage(named: "car_icon")
			}
		}
		else if (carBikeBusSegmentedControl.selectedSegmentIndex == 1) {
			if (monthlySwitch.isOn) {
				numberOfMins.text = String((((Double(roundTripMiles.text!)!)/10)*60)*20) + " mins"
				numberOfGallons.text = "0 gallons"
				vehicleImage.image = UIImage(named: "bike_icon")
			}
			else {
				numberOfMins.text = String((((Double(roundTripMiles.text!)!)/10)*60)) + " mins"
				numberOfGallons.text = "0 gallons"
				vehicleImage.image = UIImage(named: "bike_icon")
			}
		}
		else if (carBikeBusSegmentedControl.selectedSegmentIndex == 2) {
			if (monthlySwitch.isOn) {
				numberOfMins.text = String(((((Double(roundTripMiles.text!)!)/12)*60)*20)+10) + " mins"
				numberOfGallons.text = "0 gallons"
				vehicleImage.image = UIImage(named: "bus_icon")
			}
			else {
				numberOfMins.text = String(((((Double(roundTripMiles.text!)!)/12)*60))+10) + " mins"
				numberOfGallons.text = "0 gallons"
				vehicleImage.image = UIImage(named: "bus_icon")
			}
		}
	}
	@IBAction func carBikeBusSegFlipped(_ sender: UISegmentedControl) {
		updateCommuteAndGasFromSegControl()
		//updateMonthlyVsDaily()
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

