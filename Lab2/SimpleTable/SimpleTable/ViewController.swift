//
//  ViewController.swift
//  SimpleTable
//
//  Created by Ross Blassingame on 2/15/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	@IBOutlet weak var tableview: UITableView? = UITableView()
	
	private var words: [String] = ["a", "b", "c", "d"]
	
	let simpleTableIdentifier = "SimpleTableIdentifier"
	
	var searchController: UISearchController!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		if let tmp: [String] = UserDefaults.standard.object(forKey: "words") as? [String] {
			// Successfully loaded
			print("good")
			words = tmp
		} else {
			// Didn't load
			print("error")
		}
		
		navigationItem.leftBarButtonItem = editButtonItem
		
		let resultsController = SearchResultsTableViewController()
		resultsController.words = words
		searchController = UISearchController(searchResultsController: resultsController)
		
		let searchBar = searchController.searchBar
		searchBar.placeholder = "Enter a search term"
		searchBar.sizeToFit()
		tableview?.tableHeaderView = searchBar
		searchController.searchResultsUpdater = resultsController
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	//MARK: Table View DAta Source Methods
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return words.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
		
		if (cell == nil) {
			cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier:simpleTableIdentifier)
		}
		
		cell?.textLabel?.text = words[indexPath.row]
		
		return cell!
	}
	
	//MARK: Table View Delegate Methods
	
	func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
		return indexPath.row == 0 ? nil : indexPath
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let rowValue = words[indexPath.row]
		let message = "You selected \(rowValue)"
		
		let controller = UIAlertController(title: "Row Selected", message: message, preferredStyle: .alert)
		let action = UIAlertAction(title: "Yes I Did", style: .default, handler: nil)
		
		controller.addAction(action)
		present(controller, animated: true, completion: nil)
	}
	
	// Override to support editing the table view.
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			// Delete the row from the data source
			words.remove(at: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .fade)
		} else if editingStyle == .insert {
			// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
		}
	}
	
	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		// Return false if you do not want the specified item to be editable.
		return true
	}
	
	// MARK: Actions
	
	@IBAction func unwindToWordList(sender: UIStoryboardSegue) {
		if let sourceViewController = sender.source as? NewWordViewController, let word = sourceViewController.word {
			let newIndexPath = IndexPath(row: words.count, section: 0)
			words.append(word)
			UserDefaults.standard.set(words, forKey: "words")
			tableview?.insertRows(at: [newIndexPath], with: .automatic)
		}
	}
	
	
}

