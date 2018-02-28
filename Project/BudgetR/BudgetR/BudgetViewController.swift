//
//  BudgetViewController.swift
//  BudgetR
//
//  Created by Ross Blassingame on 2/14/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import UIKit

class BudgetViewController: UIViewController {
	
	@IBOutlet weak var toBeBudgetedLabel: UILabel!
	@IBOutlet weak var budgetAmountLabel: UILabel!
	
	var budgetAmount: Double = 0

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		toBeBudgetedLabel.layer.borderWidth = 1
		toBeBudgetedLabel.layer.cornerRadius = 4
		budgetAmountLabel.layer.borderWidth = 1
		budgetAmountLabel.layer.cornerRadius = 4
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}

