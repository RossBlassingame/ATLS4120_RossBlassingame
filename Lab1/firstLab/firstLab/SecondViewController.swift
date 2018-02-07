//
//  SecondViewController.swift
//  firstLab
//
//  Created by Ross Blassingame on 2/6/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
	
	@IBAction func openSafariButton(_ sender: Any) {
		//check to see if there's an app installed to handle this URL scheme
		if(UIApplication.shared.canOpenURL(URL(string: "safari://")!)){
			//open the app with this URL scheme
			UIApplication.shared.open(URL(string: "safari://")!, options: [:], completionHandler: nil)
		}else {
			UIApplication.shared.open(URL(string: "http://www.google.com/")!, options: [:], completionHandler: nil)
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

