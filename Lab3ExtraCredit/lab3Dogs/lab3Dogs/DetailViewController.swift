//
//  DetailViewController.swift
//  lab3Dogs
//
//  Created by Ross Blassingame on 2/23/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate {

	@IBOutlet weak var detailDescriptionLabel: UILabel!
	@IBOutlet weak var webView: WKWebView!

	func configureView() {
		// Update the user interface for the detail item.
		if let detail = self.detailItem {
			if let label = self.detailDescriptionLabel {
				label.text = detail.description
				loadWebPage(detail.description)
			}
		}
	}
	
	func loadWebPage(_ urlString: String){
		//the urlString should be a propery formed url
		//creates a URL object
		let myurl = URL(string: urlString)
		//create a URLRequest object
		let request = URLRequest(url: myurl!)
		//load the URLRequest object in our web view
		
		// WHY IS THIS NIL ???? I HAVE NO IDEA
		webView.load(request)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		configureView()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	var detailItem: AnyObject? {
		didSet {
		    // Update the view.
		    configureView()
		}
	}


}

