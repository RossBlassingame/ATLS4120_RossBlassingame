//
//  NewRestaurantViewController.swift
//  midterm_RossBlassingame
//
//  Created by Ross Blassingame on 3/15/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import UIKit
import os.log

class NewRestaurantViewController: UIViewController, UITextFieldDelegate {
	
	@IBOutlet weak var restaurantName: UITextField!
	@IBOutlet weak var restaurantURL: UITextField!
	@IBOutlet weak var saveButton: UIBarButtonItem!
	
	var restaurant: Restaurant?

    override func viewDidLoad() {
        super.viewDidLoad()

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
		
		restaurant = Restaurant(name: restaurantName.text!, url: restaurantURL.text!)
    }

}
