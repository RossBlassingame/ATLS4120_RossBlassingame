//
//  ViewController.swift
//  lab3
//
//  Created by Ross Blassingame on 2/23/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
	
	let reuseIdentifier = "cellIdentifier"
	var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"]

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return items.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
		
		cell.myLabel.text = self.items[indexPath.item]
		
		cell.backgroundColor = UIColor.yellow
		cell.layer.borderColor = UIColor.black.cgColor
		cell.layer.borderWidth = 2
		cell.layer.cornerRadius = 13
		
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		let label1 = UILabel()
		label1.text = items[indexPath.row]
		label1.textAlignment = .center
		label1.frame = self.view.frame
		label1.backgroundColor = UIColor.yellow
		label1.contentMode = .top
		label1.isUserInteractionEnabled = true
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
		label1.addGestureRecognizer(tap)
		
		self.view.addSubview(label1)
	}
	
	// Use to back from full mode
	@objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
		sender.view?.removeFromSuperview()
	}
	
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		var header: SupplementaryCollectionReusableView?
		if kind == UICollectionElementKindSectionHeader {
			header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? SupplementaryCollectionReusableView
			header?.headerLabel.text = "Numbers"
		}
		return header!
	}

	
	/*
	// Highlights when user touches cell.
	func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
		let cell = collectionView.cellForItem(at: indexPath)
		cell?.backgroundColor = UIColor.red
	}
	
	// Undo background color change when user releases finger.
	func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
		let cell = collectionView.cellForItem(at: indexPath)
		cell?.backgroundColor = UIColor.yellow
	}
	*/

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

