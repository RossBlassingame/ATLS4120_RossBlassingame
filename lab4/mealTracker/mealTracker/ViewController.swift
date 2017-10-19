//
//  ViewController.swift
//  mealTracker
//
//  Created by Ross Blassingame on 10/19/17.
//  Copyright © 2017 Ross Blassingame. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mealLabel: UILabel!
    
    var myMeal = Meal()
    
    @IBAction func unwindSegue (_ segue:UIStoryboardSegue){
        mealLabel.text=myMeal.meal
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

