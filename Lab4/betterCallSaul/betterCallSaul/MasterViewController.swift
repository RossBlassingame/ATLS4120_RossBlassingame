//
//  MasterViewController.swift
//  betterCallSaul
//
//  Created by Ross Blassingame on 2/26/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

	var detailViewController: DetailViewController? = nil
	var episodes = [Episode]()


	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		loadJSON()
	}
	
	func loadJSON(){
		let urlPath = "https://api.tvmaze.com/singlesearch/shows?q=better-call-saul&embed=episodes"
		guard let url = URL(string: urlPath)
			else {
				print("url error")
				return
		}
		
		let session = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
			let httpResponse = response as! HTTPURLResponse
			let statusCode = httpResponse.statusCode
			guard statusCode == 200
				else {
					print("file download error")
					return
			}
			//download successful
			print("download complete")
			DispatchQueue.main.async {self.parsejson(data!)}
		})
		//must call resume to run session
		session.resume()
	}
	
	func parsejson(_ data: Data){
		//print(data)
		do {
			// get json data
			let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:Any]
			//get all results
			let tmp1 = json["_embedded"] as! [String:Any]
			let allresults = tmp1["episodes"] as! [[String:Any]]
			print(allresults)
			
			//add results to objects
			for result in allresults {
				//check that data exists
				guard let newtitle = result["name"]! as? String,
					let newEpisodeNumber = result["number"] as? Int,
					let newurl = result["url"]!as? String
					else {
						continue
				}
				//create new object
				let newEpisode = Episode(title: newtitle, episodeNumber: newEpisodeNumber, url: newurl)
				//add object to array
				self.episodes.append(newEpisode)
			}
			//handle thrown error
		} catch {
			print("Error with JSON: \(error)")
			return
		}
		//reload the table data after the json data has been downloaded
		tableView.reloadData()
	}
	

	override func viewWillAppear(_ animated: Bool) {
		clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
		super.viewWillAppear(animated)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: - Segues

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showDetail" {
		    if let indexPath = tableView.indexPathForSelectedRow {
				let episode = episodes[indexPath.row]
				let title = episode.title
				let url = episode.url
				let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
				controller.detailItem = url
				controller.title = title
				controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
				controller.navigationItem.leftItemsSupplementBackButton = true
		    }
		}
	}

	// MARK: - Table View

	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return episodes.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		let episode = episodes[indexPath.row]
		cell.textLabel!.text = episode.title
		
		return cell
	}
}

