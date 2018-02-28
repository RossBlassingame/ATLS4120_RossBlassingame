//
//  Account.swift
//  BudgetR
//
//  Created by Ross Blassingame on 2/14/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import UIKit

class Account {
	
	//MARK: Properties
	
	var name: String
	var balance: Double
	
	//MARK: Initialization
	
	init?(name: String, balance: Double) {
		if name.isEmpty || balance.isNaN {
			return nil
		}
		
		self.name = name
		self.balance = balance
	}
	
}
