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
    var Villain = villain()
    var tillNextHero = 0
    
    @IBOutlet weak var continueLabel: UILabel!
    @IBOutlet weak var victoryView: UIView!
    
    
    func resetHeroTimer()->Int{
        let var1 = arc4random_uniform(3) + 1
        let var2 = arc4random_uniform(3)
        let setup = var1 + var2
        let timer = Int(setup)
        return timer
    }
    player.tillNextHero = resetHeroTimer()
    
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
