//
//  Scene2ViewController.swift
//  mealTracker
//
//  Created by Ross Blassingame on 10/19/17.
//  Copyright © 2017 Ross Blassingame. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userMeal: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindSeg"{
            let scene1ViewController = segue.destination as! ViewController
            //check to see that text was entered in the textfields
            if userMeal.text!.isEmpty == false{
                scene1ViewController.myMeal.meal=userMeal.text
            }
        }
    }
    
    override func viewDidLoad() {
        //userMeal.delegate=self
        //dateCooked.delegate=self
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
