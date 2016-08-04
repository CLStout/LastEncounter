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
            win()
        }
    }

    
    func win(){
        if (player.statToUpgrade == "health"){
            player.health += 1
        }
        else if(player.statToUpgrade == "mana"){
            player.mana += 1
        }
        else if(player.statToUpgrade == "attack"){
            player.attack += 1
        }
        else if(player.statToUpgrade == "magic"){
            player.magic += 1
        }
        else if(player.statToUpgrade == "defense"){
            player.defense += 1
        }

            performSegueWithIdentifier("diceToWaitingSegue", sender: nil)
        
    }
    

    
    
    
    
    

    @IBAction func onTappedRollButton(sender: AnyObject) {
        count += count
        toss()
        if count == 3{
            performSegueWithIdentifier("diceToWaitingSegue", sender: nil)
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        let dvc = segue.destinationViewController as! WaitingViewController
        dvc.player = self.player
    }
    
    
}


