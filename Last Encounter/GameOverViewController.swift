//
//  LoseViewController.swift
//  Last Encounter
//
//  Created by Zachary Rutherford on 8/1/16.
//  Copyright © 2016 Chris Stout. All rights reserved.
//

import UIKit
import AVFoundation

class GameOverViewController: UIViewController {
    
    
    @IBOutlet weak var resetButton: UILabel!
    @IBOutlet weak var gameOverViewController: UIView!
    
    var background : AVAudioPlayer?
    var player = villain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("Intro.mp3", ofType:nil)!
        let url = NSURL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOfURL: url)
            background = sound
            sound.play()
            sound.volume = 0.5
        } catch {
            // couldn't load file :(
        }
    }
    
    @IBAction func tapGameOverScreen(sender: AnyObject) {
        if CGRectContainsPoint(resetButton.frame, sender.locationInView(gameOverViewController)){
            performSegueWithIdentifier("titleScreenSegue", sender: nil)
        }
    }
    
}
