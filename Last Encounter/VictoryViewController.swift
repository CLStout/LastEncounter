//
//  VictoryViewController.swift
//  Last Encounter
//
//  Created by Stanley Stout on 8/1/16.
//  Copyright © 2016 Chris Stout. All rights reserved.
//

import UIKit
import AVFoundation

class VictoryViewController: UIViewController {

    var player = villain()
    
    
    @IBOutlet weak var continueLabel: UILabel!
    @IBOutlet weak var victoryView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player.heroesMassacred += 1
    }
    
    @IBAction func tapContinueButton(sender: AnyObject) {
        if CGRectContainsPoint(continueLabel.frame, sender.locationInView(victoryView)){
            performSegueWithIdentifier("returnToWaitingSegue", sender: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! WaitingViewController
        dvc.player = self.player
    }
}
