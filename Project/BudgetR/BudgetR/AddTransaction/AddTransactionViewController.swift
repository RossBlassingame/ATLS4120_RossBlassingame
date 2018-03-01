//
//  AddTransactionViewController.swift
//  BudgetR
//
//  Created by Ross Blassingame on 2/14/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import UIKit

class AddTransactionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

	@IBOutlet weak var expenseIncomeSegmentControl: UISegmentedControl!
	@IBOutlet weak var amountTextField: UITextField!
	@IBOutlet weak var payeeTextField: UITextField!
	@IBOutlet weak var categoryPicker: UIPickerView!
	@IBOutlet weak var accountPicker: UIPickerView!
	@IBOutlet weak var datePicker: UIDatePicker!
	
	@IBAction func saveButtonPressed(_ sender: Any) {
		let isExpense = expenseIncomeSegmentControl.selectedSegmentIndex == 0 ? true : false
		let amount = Double(amountTextField.text!)
		let payee = payeeTextField.text
		let category: BudgetCategory = sharedData.sharedInstance.budgetCategories[Int(categoryPicker.selectedRow(inComponent: 0).description)!]
		let account: Account = sharedData.sharedInstance.accounts[Int(accountPicker.selectedRow(inComponent: 0).description)!]
		let date: Date = datePicker.date
		
		let newTransaction = Transaction(isExpense: isExpense, amount: amount!, payee: payee!, category: category, account: account, date: date)
		
		// Finds selected account in the account list, and append the new transaction to the list.
		for i in 0...(sharedData.sharedInstance.accounts.count - 1) {
			if sharedData.sharedInstance.accounts[i].name == account.name {
				sharedData.sharedInstance.accounts[i].transactions += [newTransaction!]
				sharedData.sharedInstance.accounts[i].balance -= amount!
			}
		}
		
		// Finds selected budget category and subtracts amount from that category.
		for i in 0...(sharedData.sharedInstance.budgetCategories.count - 1) {
			if sharedData.sharedInstance.budgetCategories[i].name == category.name {
				sharedData.sharedInstance.budgetCategories[i].amount -= amount!
			}
		}
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	override func viewWillAppear(_ animated: Bool) {
		categoryPicker.reloadAllComponents()
		accountPicker.reloadAllComponents()
	}
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		// Category Picker
		if (pickerView.tag == 0) {
			return sharedData.sharedInstance.budgetCategories.count
		} else {// if (pickerView.tag == 1){ // Account Picker
			return sharedData.sharedInstance.accounts.count
		}
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		var budgetCategoryTitles = [String]()
		var accountNames = [String]()
		for budget in sharedData.sharedInstance.budgetCategories {
			budgetCategoryTitles += [budget.name]
		}
		for account in sharedData.sharedInstance.accounts {
			accountNames += [account.name]
		}
		// Category Picker
		if (pickerView.tag == 0){
			return "\(budgetCategoryTitles[row])"
		} else {
			return "\(accountNames[row])"
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

