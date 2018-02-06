//
//  ViewController.swift
//  daVinci
//
//  Created by Ross Blassingame on 9/5/17.
//  Copyright © 2017 Ross Blassingame. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var artImage: UIImageView!
	@IBOutlet weak var artText: UILabel!
	
	@IBAction func chooseArt(_ sender: UIButton) {
		if sender.tag == 1 {
			artImage.image = UIImage(named: "monaLisa")
			artText.text = "Mona Lisa"
		}
		else if sender.tag == 2 {
			artImage.image = UIImage(named: "Vitruvian")
			artText.text = "Vitruvian Man"
		}
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

