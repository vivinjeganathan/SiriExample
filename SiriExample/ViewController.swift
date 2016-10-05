//
//  ViewController.swift
//  SiriExample
//
//  Created by Mac_Admin on 03/10/16.
//

import UIKit
import Intents

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        INPreferences.requestSiriAuthorization { (status) in
            
            if status != .authorized
            {
                print("Authorization issues")
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

