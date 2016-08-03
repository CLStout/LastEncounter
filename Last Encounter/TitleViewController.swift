//
//  TitleViewController.swift
//  Last Encounter
//
//  Created by Zachary Rutherford on 8/1/16.
//  Copyright © 2016 Chris Stout. All rights reserved.
//

import UIKit
import AVFoundation

class TitleViewController: UIViewController {
    
    var background : AVAudioPlayer?
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if background == nil{
        let path = NSBundle.mainBundle().pathForResource("Waiting.wav", ofType:nil)!
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
    }
    
    @IBAction func beginButton(sender: AnyObject) {
        performSegueWithIdentifier("begin", sender: nil)
    }
    
    
    @IBAction func howToPlayButton(sender: AnyObject) {
        performSegueWithIdentifier("howToPlay", sender: nil)
    }
    
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "begin"){
            let dvc = segue.destinationViewController as! AllocationViewController
            dvc.background = self.background
        }
        else{
            let dvc = segue.destinationViewController as! AboutGameViewController
            dvc.background = self.background
        }
    }

}

