//
//  sharedData.swift
//  BudgetR
//
//  Created by Ross Blassingame on 2/28/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import Foundation

class sharedData {
	static let sharedInstance = sharedData()
	
	var accounts = [Account]()
	var budgetCategories = [BudgetCategory]()
}
