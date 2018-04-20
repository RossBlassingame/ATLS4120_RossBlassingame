//
//  BudgetCategory.swift
//  BudgetR
//
//  Created by Ross Blassingame on 2/28/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import UIKit

class BudgetCategory {
	
	//MARK: Properties
	
	var name: String
	var amount: Double
	
	//MARK: Initialization
	
	init?(name: String, amount: Double) {
		if name.isEmpty || amount.isNaN {
			return nil
		}
		
		self.name = name
		self.amount = amount
	}
	
}
