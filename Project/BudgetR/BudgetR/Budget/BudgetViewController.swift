//
//  BudgetViewController.swift
//  BudgetR
//
//  Created by Ross Blassingame on 2/14/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import UIKit

class BudgetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var toBeBudgetedLabel: UILabel!
	@IBOutlet weak var budgetAmountLabel: UILabel!
	@IBOutlet weak var budgetCategoriesTableView: UITableView!
	
	var budgetAmount: Double = 0.0//sumOfAccountBalances()
	

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		toBeBudgetedLabel.layer.borderWidth = 1
		toBeBudgetedLabel.layer.cornerRadius = 4
		budgetAmountLabel.layer.borderWidth = 1
		budgetAmountLabel.layer.cornerRadius = 4
		
		budgetAmountLabel.text = String(budgetAmount)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		updateBudgetAmountLabel()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sharedData.sharedInstance.budgetCategories.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		// Table view cells are reused and should be dequeued using a cell identifier.
		let cellIdentifier = "BudgetTableViewCell"
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? BudgetTableViewCell else {
			fatalError("The dequeued cell is not an instance of BudgetTableViewCell.")
		}
		
		let category = sharedData.sharedInstance.budgetCategories[indexPath.row]
		
		cell.categoryNameLabel.text = category.name
		cell.categoryAmountLabel.text = String(category.amount)
		
		return cell
	}
	
	@IBAction func unwindFromNewBudgetCategory(sender: UIStoryboardSegue) {
		let newBCVC = sender.source as? NewBudgetCategoryViewController
		
		guard let category = BudgetCategory(name: (newBCVC?.categoryNameTextField.text!)!, amount: Double(newBCVC!.categoryAmountTextField.text!)!) else { fatalError("Unable to instantiate budget category.") }
		
		sharedData.sharedInstance.budgetCategories += [category]

		budgetCategoriesTableView.reloadData()
	}
	
	//MARK: Private Methods
	
	func sumOfAllBudgetCategoryAmounts() -> Double {
		var sum: Double = 0.0
		for budget in sharedData.sharedInstance.budgetCategories {
			sum += budget.amount
		}
		return sum
	}
	
	func sumOfAccountBalances() -> Double {
		var sum = 0.0
		for account in sharedData.sharedInstance.accounts {
			sum += account.balance
		}
		return sum
	}
	
	func amountNeededToBeBudgeted() -> Double {
		let balanceBetweenAllAccounts = sumOfAccountBalances()
		let balanceBetweenAllBudgetCategories = sumOfAllBudgetCategoryAmounts()
		
		let difference = balanceBetweenAllAccounts - balanceBetweenAllBudgetCategories
		
		return difference
	}
	
	func updateBudgetAmountLabel() {
		let difference = amountNeededToBeBudgeted()
		budgetAmountLabel.text = String(difference)
		if difference >= 0 {
			budgetAmountLabel.backgroundColor = UIColor.green
			toBeBudgetedLabel.backgroundColor = UIColor.green
		} else {
			budgetAmountLabel.backgroundColor = UIColor.red
			toBeBudgetedLabel.backgroundColor = UIColor.red
		}
	}

}

