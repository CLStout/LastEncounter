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
    
    @IBOutlet weak var levelLabel: UILabel!
    var background : AVAudioPlayer?
    var player = villain()
    @IBOutlet weak var warningLabel: UILabel!
    var Villain = villain()
    var statToUpgrade = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLevelLabel()
        
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
    
    func updateLevelLabel(){
        var currentLevel = (player.health + player.mana + player.attack + player.magic + player.defense) - 69
        levelLabel.text = "Level " + String(currentLevel)
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
    
    func decideMinigame(){
        //var minigameChoice = arc4random_uniform(2)
        var minigameChoice = 0
            if(minigameChoice == 0){
                performSegueWithIdentifier("tapSegue", sender: nil)
                
            }
            else if(minigameChoice == 1){
                performSegueWithIdentifier("diceSegue", sender: nil)
                
            }
            else if(minigameChoice == 2){
                performSegueWithIdentifier("brickSegue", sender: nil)
                
            }
            else {
                //fallback?
                print("NORMIES ON MY BOARD REEEEE")
        }
    }
    
    func helper1(){
        player.tillNextHero -= 1
        updateTurnLabel()
        checkIfBattle()
        updateLevelLabel()
        decideMinigame()
    }
    
    @IBAction func onTappedTrainHealth(sender: AnyObject) {
        player.health += 1
        player.statToUpgrade = "health"
        helper1()
    }
    
    @IBAction func onTappedTrainMana(sender: AnyObject) {
        player.mana += 1
        player.statToUpgrade = "mana"
        helper1()
    }
    
    @IBAction func onTappedTrainAttack(sender: AnyObject) {
        player.attack += 1
        player.statToUpgrade = "attack"
        helper1()
    }
    
    @IBAction func onTappedTrainMagic(sender: AnyObject) {
        player.magic += 1
        player.statToUpgrade = "magic"
        helper1()
    }
    
    @IBAction func onTappedTrainDefense(sender: AnyObject) {
        player.defense += 1
        player.statToUpgrade = "defense"
        helper1()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "goToBattle"){
            let dvc = segue.destinationViewController as! ViewController
            dvc.player = self.player
        }
        else if (segue.identifier == "tapSegue"){
            let dvc = segue.destinationViewController as! TapViewController
            dvc.player = self.player
        }
        else if (segue.identifier == "diceSegue"){
            let dvc = segue.destinationViewController as! DiceViewController
            dvc.player = self.player
        }
        else if (segue.identifier == "brickSegue"){
            let dvc = segue.destinationViewController as! BrickViewController
            dvc.player = self.player
        }
        else{
            let dvc = segue.destinationViewController as! equipViewController
            dvc.player = self.player
        }
        
    }
    
}


