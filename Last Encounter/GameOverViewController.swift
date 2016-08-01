//
//  GameOverViewController.swift
//  Last Encounter
//
//  Created by Stanley Stout on 8/1/16.
//  Copyright © 2016 Chris Stout. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    
    @IBOutlet weak var resetLabel: UILabel!
    @IBOutlet weak var gameOverView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapGameOverScreen(sender: AnyObject) {
        if CGRectContainsPoint(resetLabel.frame, sender.locationInView(gameOverView)){
            performSegueWithIdentifier("titleScreenSegue", sender: nil)
        }
    }
}
