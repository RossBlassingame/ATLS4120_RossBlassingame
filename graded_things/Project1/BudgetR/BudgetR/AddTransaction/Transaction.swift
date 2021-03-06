//
//  Transaction.swift
//  BudgetR
//
//  Created by Ross Blassingame on 2/28/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import UIKit

class Transaction {
	
	//MARK: Properties
	
	var isExpense: Bool // if true, this transaction is an expense. If false, it's income.
	var amount: Double
	var payee: String
	var category: BudgetCategory
	var account: Account
	var date: Date
	
	//MARK: Initialization
	
	init?(isExpense: Bool, amount: Double, payee: String, category: BudgetCategory, account: Account, date: Date) {
		if payee.isEmpty || amount.isNaN {
			return nil
		}
		
		self.isExpense = isExpense
		self.amount = amount
		self.payee = payee
		self.category = category
		self.account = account
		self.date = date
	}
	
}
