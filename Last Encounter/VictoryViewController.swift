//
//  VictoryViewController.swift
//  Last Encounter
//
//  Created by Stanley Stout on 8/1/16.
//  Copyright © 2016 Chris Stout. All rights reserved.
//

import UIKit

class VictoryViewController: UIViewController {

    @IBOutlet weak var continueLabel: UILabel!
    @IBOutlet weak var victoryView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapContinueButton(sender: AnyObject) {
        if CGRectContainsPoint(continueLabel.frame, sender.locationInView(victoryView)){
            performSegueWithIdentifier("returnToWaitingSegue", sender: nil)
        }
    }
}
