//
//  Restaurant.swift
//  midterm_RossBlassingame
//
//  Created by Ross Blassingame on 3/15/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import Foundation

/*
Data model class.
*/

class Restaurant {
	var name: String
	var url: String
	
	//MARK: Initialization
	
	init?(name: String, url: String) {
		
		// Initialization should fail if there is no name or there is no url
		if name.isEmpty || url.isEmpty {
			return nil
		}
		
		// Initialize stored properties.
		self.name = name
		self.url = url
		
	}
}
