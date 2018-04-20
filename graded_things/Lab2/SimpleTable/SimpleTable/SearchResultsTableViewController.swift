//
//  SearchResultsTableViewController.swift
//  SimpleTable
//
//  Created by Ross Blassingame on 2/19/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController, UISearchResultsUpdating {
	
	let sectionsTableIdentifier = "SimpleTableIdentifier"
	var words: [String] = [String]()
	var filteredNames: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: sectionsTableIdentifier)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return filteredNames.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: sectionsTableIdentifier)
		cell!.textLabel?.text = filteredNames[indexPath.row]
		return cell!
	}

	func updateSearchResults(for searchController: UISearchController) {
		if let searchString = searchController.searchBar.text {
			filteredNames.removeAll(keepingCapacity: true)
			
			if !searchString.isEmpty {
				let filter: (String) -> Bool = { name in
					let range = name.range(of: searchString, options: NSString.CompareOptions.caseInsensitive, range: nil, locale: nil)
					return range != nil
				}
				let matches = words.filter(filter)
				filteredNames += matches
			}
		}
		tableView.reloadData()
	}
	
}
