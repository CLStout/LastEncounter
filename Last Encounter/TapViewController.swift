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
    
    @IBOutlet weak var progressViewHealth: UIProgressView!
    @IBOutlet weak var enemyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var enemyImage: UIButton!
    var seconds = 6
    var player = villain()
    var trump = 18
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(TapViewController.timerFunction), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func onTappedEnemy(sender: AnyObject) {
        trump -= 1
        print(trump)
        
        let fractionalProgress = Float(trump) / 10
        let animated = trump != 0
        
        progressViewHealth.setProgress(fractionalProgress, animated: animated)
        
        if trump == 0{
            winMinigame()
        }
    }
    
    func loseMinigame(){
        //segue back to wait screen
        returnToWait()
    }
    
    func winMinigame(){
        if (player.statToUpgrade == "health"){
            player.health += 1
            returnToWait()
        }
        else if(player.statToUpgrade == "mana"){
            player.mana += 1
            returnToWait()
        }
        else if(player.statToUpgrade == "attack"){
            player.attack += 1
            returnToWait()
        }
        else if(player.statToUpgrade == "magic"){
            player.magic += 1
            returnToWait()
        }
        else if(player.statToUpgrade == "defense"){
            player.defense += 1
            returnToWait()
        }
        else{
            returnToWait()
            //something somewhere went horribly wrong
        }
        
    }
    
    func returnToWait(){
        
        performSegueWithIdentifier("tapToWaitingSegue", sender: nil)
    }
    
    
    
    func timerFunction() {
        seconds -= 1
        timeLabel.text = "You only have " + String(seconds) + " seconds!"
        if (seconds < 1){
            loseMinigame()
        }
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        let dvc = segue.destinationViewController as! WaitingViewController
        dvc.player = self.player
}
}