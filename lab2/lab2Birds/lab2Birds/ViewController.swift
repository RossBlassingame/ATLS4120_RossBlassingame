//
//  ViewController.swift
//  lab2Birds
//
//  Created by Ross Blassingame on 9/14/17.
//  Copyright © 2017 Ross Blassingame. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var birdImage: UIImageView!
	@IBOutlet weak var birdLabel: UILabel!
	@IBOutlet weak var birdSegControl: UISegmentedControl!
	@IBOutlet weak var capitalSwitch: UISwitch!
	@IBOutlet weak var fontSlider: UISlider!
	@IBOutlet weak var fontSizeLabel: UILabel!

	func updateImageAndLabel() {
		if (birdSegControl.selectedSegmentIndex == 0) {
			birdImage.image = UIImage(named: "protec")
			birdLabel.text = "he protec"
		}
		else if (birdSegControl.selectedSegmentIndex == 1) {
			birdImage.image = UIImage(named: "attac")
			birdLabel.text = "he attac"
		}
	}
	
	func updateCaps() {
		if (capitalSwitch.isOn) {
			birdLabel.text = birdLabel.text?.uppercased()
		}
		else  {
			birdLabel.text = birdLabel.text?.lowercased()
		}
	}
	
	@IBAction func birdSegControlFlipped(_ sender: UISegmentedControl) {
		updateImageAndLabel()
		updateCaps()
	}
	@IBAction func capitalizeSwitchFlipped(_ sender: UISwitch) {
		updateCaps()
	}
	@IBAction func fontSliderAction(_ sender: UISlider) {
		let fontSize = sender.value
		fontSizeLabel.text = String(format: "%.0f", fontSize)
		birdLabel.font = UIFont.systemFont(ofSize:CGFloat(fontSize))
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

