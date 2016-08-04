//
//  ViewController6side.swift
//  Randomizer
//
//  Created by Zachary Rutherford on 7/25/16.
//  Copyright © 2016 Zachary Rutherford. All rights reserved.
//

import UIKit

class DiceViewController: UIViewController {

    
    
    
    @IBOutlet weak var toddUIImage: UIImageView!
    @IBOutlet weak var resultImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var one = 0
    var two = 0
    var three = 0
    var four = 0
    var five = 0
    var six = 0
    var player = villain()
    var count = 0
    
    
    func toss (){
        count += count
        var chance = Int(arc4random_uniform(6))
        if chance == 0{
            resultImageView.image = UIImage (named: ("one face"))
        }
        else if chance == 1{
            resultImageView.image = UIImage (named: ("two face"))
        }
        else if chance == 2{
            resultImageView.image = UIImage (named: ("three face"))
        }
        else if chance == 3{
            resultImageView.image = UIImage (named: ("four face"))
            four = four + 1
        }
        else if chance == 4{
            resultImageView.image = UIImage (named: ("five face"))
            five = five + 1
        }
        else if chance == 5{
            resultImageView.image = UIImage (named: ("four face 6"))
            six = six + 1
        }
        if chance > 2 {
            performSegueWithIdentifier("diceToWaitingSegue", sender: nil)
        }
        if count == 3{
            performSegueWithIdentifier("diceToWaitingSegue", sender: nil)
        }
    }

    
    
    

    
    
    
    
    

    @IBAction func onTappedRollButton(sender: AnyObject) {
        toss()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        let dvc = segue.destinationViewController as! WaitingViewController
        dvc.player = self.player
    }
    
    
}


