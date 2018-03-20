//
//  NewRecipeViewController.swift
//  recipes
//
//  Created by Ross Blassingame on 3/19/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import UIKit

class NewRecipeViewController: UIViewController {
	
	@IBOutlet weak var recipeName: UITextField!
	@IBOutlet weak var recipeURL: UITextField!
	
	var addedrecipe = String()
	var addedurl = String()
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "savesegue" {
			if recipeName.text?.isEmpty == false {
				addedrecipe=recipeName.text!
				addedurl=recipeURL.text!
			}
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
