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
    
    @IBOutlet weak var continueLabel: UILabel!
    @IBOutlet weak var victoryView: UIView!
    
  
    var player = villain()
    var Villain = villain()
    var tillNextHero = 0
    var background : AVAudioPlayer?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            let path = NSBundle.mainBundle().pathForResource("Victory.mp3", ofType:nil)!
            let url = NSURL(fileURLWithPath: path)
            
            do {
                let sound = try AVAudioPlayer(contentsOfURL: url)
                background = sound
                sound.play()
                sound.volume = 0.5
            } catch {
                
                // couldn't load file :(
            }

    
        player.heroesKilled += 1
        player.tillNextHero = Int(arc4random_uniform(3)) + 1
        
        var danYasoobMessageChance = arc4random_uniform(19)
        if (danYasoobMessageChance == 19){
            continueLabel.text = "Dan and Yasoob deserve a raise"
        }
    }
    
    @IBAction func tapContinueButton(sender: AnyObject) {
        if CGRectContainsPoint(continueLabel.frame, sender.locationInView(victoryView)){
            performSegueWithIdentifier("returnToWaitingSegue", sender: nil)
            if background != nil {
                background!.stop()
                background = nil
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! WaitingViewController
        dvc.player = self.player
    }
}
