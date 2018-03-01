//
//  AccountTableViewController.swift
//  BudgetR
//
//  Created by Ross Blassingame on 2/14/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import UIKit

class AccountTableViewController: UITableViewController {
	
	//MARK: Properties

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
	
	override func viewWillAppear(_ animated: Bool) {
		tableView.reloadData()
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sharedData.sharedInstance.accounts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		// Table view cells are reused and should be dequeued using a cell identifier.
		let cellIdentifier = "AccountTableViewCell"
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AccountTableViewCell else {
			fatalError("The dequeued cell is not an instance of AccountTableViewCell.")
		}
		
		let account = sharedData.sharedInstance.accounts[indexPath.row]

        cell.accountNameLabel.text = account.name
		cell.accountBalanceLabel.text = String(account.balance)

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
		if segue.identifier == "accountToTransactionsSegue" {
			let destVC = segue.destination as? AccountTransactionsTableViewController
			let cell = sender as? AccountTableViewCell
			var t: [Transaction] = [Transaction]()
			for i in 0...(sharedData.sharedInstance.accounts.count - 1) {
				if sharedData.sharedInstance.accounts[i].name == cell?.accountNameLabel.text {
					t = sharedData.sharedInstance.accounts[i].transactions
				}
			}
			destVC?.transactions = t
		}
    }

	
	@IBAction func unwindFromNewAccount(sender: UIStoryboardSegue) {
		let accountVC = sender.source as? AccountViewController
		
		guard let account = Account(name: (accountVC?.accountNameTextField.text!)!, balance: Double(accountVC!.accountBalanceTextField.text!)!) else { fatalError("Unable to instantiate account.") }
			
		sharedData.sharedInstance.accounts += [account]
		
		tableView.reloadData()
	}
	@IBAction func unwindFromNewAccountCancel(sender: UIStoryboardSegue) {
		dismiss(animated: true, completion: nil)
	}

}
