//
//  WaitingViewController.swift
//  Last Encounter
//
//  Created by Zachary Rutherford on 7/30/16.
//  Copyright © 2016 Chris Stout. All rights reserved.
//

import UIKit
import AVFoundation

class WaitingViewController: UIViewController {
    
    var background : AVAudioPlayer?
    var player = villain()
    @IBOutlet weak var warningLabel: UILabel!
    var Villain = villain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("Waiting.wav", ofType:nil)!
        let url = NSURL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOfURL: url)
            background = sound
            sound.play()
            sound.volume = 1
        } catch {
            // couldn't load file :(
        }
        
        if player.tillNextHero == 0 {
            player.tillNextHero = resetHeroTimer()
            print(Villain.health)
        }
        updateTurnLabel()
    }
    
    func updateTurnLabel(){
        warningLabel.text = "The Next Hero Will Be Here In \(player.tillNextHero) Turn(s)!"
    }
    
    func resetHeroTimer()->Int{
        let var1 = arc4random_uniform(3) + 1
        let var2 = arc4random_uniform(3)
        let setup = var1 + var2
        let timer = Int(setup)
        return timer
    }
    
    func checkIfBattle(){
        if (player.tillNextHero == 0){
                performSegueWithIdentifier("goToBattle", sender: nil)
            if background != nil {
                background!.stop()
                background = nil
            }
        }
    }
    
    func helper1(){
        player.tillNextHero -= 1
        updateTurnLabel()
        checkIfBattle()
    }
    
    @IBAction func onTappedTrainHealth(sender: AnyObject) {
        player.health += 1
        helper1()
    }
    
    @IBAction func onTappedTrainMana(sender: AnyObject) {
        player.mana += 1
        helper1()
    }
    
    @IBAction func onTappedTrainAttack(sender: AnyObject) {
        player.attack += 1
        helper1()
    }
    
    @IBAction func onTappedTrainMagic(sender: AnyObject) {
        player.magic += 1
        helper1()
    }
    
    @IBAction func onTappedTrainDefense(sender: AnyObject) {
        player.defense += 1
        helper1()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "goToBattle"){
            let dvc = segue.destinationViewController as! ViewController
            dvc.player = self.player
        }
        else{
            let dvc = segue.destinationViewController as! equipViewController
            dvc.player = self.player
        }
        
    }
    
}


