//
//  episode.swift
//  betterCallSaul
//
//  Created by Ross Blassingame on 2/26/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import Foundation

struct Episode: Decodable{
	let title: String
	let episodeNumber: Int
	let url : String
}
