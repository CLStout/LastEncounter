//
//  TapViewController.swift
//  Last Encounter
//
//  Created by Alex Israelov on 8/3/16.
//  Copyright © 2016 Chris Stout. All rights reserved.
//

import UIKit
import Foundation

class TapViewController: UIViewController {

    @IBOutlet weak var enemyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var enemyImage: UIButton!
    var timesClicked = 0
    var seconds = 6
    var player = villain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(TapViewController.timerFunction), userInfo: nil, repeats: true)

    }

    @IBAction func onTappedEnemy(sender: AnyObject) {
        timesClicked += 1
    }
    
    func loseMinigame(){
        //segue back to wait screen
    }
    
    func winMinigame(){
        if (player.statToUpgrade == "health"){
            player.health += 1
        }
        
        //segue back to wait screen
    }
    
    func timerFunction() {
        seconds -= 1
        timeLabel.text = "You only have " + String(seconds) + " seconds!"
        if (seconds < 1){
            loseMinigame()
        }
    }

}
