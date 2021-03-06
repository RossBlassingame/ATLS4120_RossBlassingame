//
//  MasterViewController.swift
//  midterm_RossBlassingame
//
//  Created by Ross Blassingame on 3/15/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

/*

COMPLETED:

1.
	a. Master shows list of restaurants
	b. Detail loads website
	c. Model class
	d. Loaded from .plist
2. Delete
3. Add
4. Load from .plst
5. Persistent

*/

import UIKit

class MasterViewController: UITableViewController {

	var detailViewController: DetailViewController? = nil
	var restaurants = [Restaurant]()


	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		// URL for our plist
		if let pathURL = Bundle.main.url(forResource: "restaurants", withExtension: "plist"){
			//creates a property list decoder object
			let plistdecoder = PropertyListDecoder()
			do {
				let data = try Data(contentsOf: pathURL)
				//decodes the property list
				var tmpList = [[String : String]]()
				tmpList = try plistdecoder.decode([[String:String]].self, from: data)
				for r in tmpList {
					let tmpRestaurant: Restaurant = Restaurant(name: r["name"]!, url: r["url"]!)!
					restaurants.append(tmpRestaurant)
				}
			} catch {
				// handle error
				print(error)
			}
		}
		
		convertFromListToRestaurants()
		
		/*
		navigationItem.leftBarButtonItem = editButtonItem
		*/
		
		/*
		let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
		navigationItem.rightBarButtonItem = addButton
		*/


		if let split = splitViewController {
		    let controllers = split.viewControllers
		    detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
		}
	}

	override func viewWillAppear(_ animated: Bool) {
		clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
		super.viewWillAppear(animated)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	/*
	@objc
	func insertNewObject(_ sender: Any) {
		restaurants.insert(NSDate(), at: 0)
		let indexPath = IndexPath(row: 0, section: 0)
		tableView.insertRows(at: [indexPath], with: .automatic)
	}
	*/

	// MARK: - Segues

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showDetail" {
		    if let indexPath = tableView.indexPathForSelectedRow {
		        let restaurant = restaurants[indexPath.row]
				let url = restaurant.url
				let name = restaurant.name
		        let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
		        controller.detailItem = url as AnyObject?
				controller.title = name
		        controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
		        controller.navigationItem.leftItemsSupplementBackButton = true
		    }
		}
	}
	

	// MARK: - Table View

	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return restaurants.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

		let restaurant = restaurants[indexPath.row]
		cell.textLabel!.text = restaurant.name
		return cell
	}

	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		// Return false if you do not want the specified item to be editable.
		return true
	}

	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
		    restaurants.remove(at: indexPath.row)
			convertRestaurantToArrayAndSave()
		    tableView.deleteRows(at: [indexPath], with: .fade)
		} else if editingStyle == .insert {
		    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
		}
	}
	
	
	// MARK: Actions
	
	@IBAction func unwindToRestaurantList(sender: UIStoryboardSegue) {
		if let sourceViewController = sender.source as? NewRestaurantViewController, let restaurant = sourceViewController.restaurant {
			//let newIndexPath = IndexPath(row: restaurants.count, section: 0)
			restaurants.append(restaurant)
			
			convertRestaurantToArrayAndSave()
			//searchHelper()
			//UserDefaults.standard.set(words, forKey: "words")
			//tableview?.insertRows(at: [newIndexPath], with: .automatic)
			
			tableView.reloadData()
		}
	}
	
	func convertRestaurantToArrayAndSave() {
		var restaurantList = [[String]]()
		for r in restaurants {
			restaurantList.append([r.name, r.url])
		}
		UserDefaults.standard.set(restaurantList, forKey: "midtermRestaurants")
	}
	
	func convertFromListToRestaurants() {
		if let tmp: [[String]] = UserDefaults.standard.object(forKey: "midtermRestaurants") as? [[String]] {
			// Successfully loaded
			print("good")
			var tmpRestaurants = [Restaurant]()
			for item in tmp {
				tmpRestaurants.append(Restaurant(name: item[0], url: item[1])!)
			}
			restaurants = tmpRestaurants
		} else {
			// Didn't load
			print("error")
		}
	}


}

