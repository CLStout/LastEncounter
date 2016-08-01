//
//  WaitingViewController.swift
//  Last Encounter
//
//  Created by Zachary Rutherford on 7/30/16.
//  Copyright © 2016 Chris Stout. All rights reserved.
//

import UIKit

class WaitingViewController: UIViewController {
    
    var tillNextHero = 0
    @IBOutlet weak var warningLabel: UILabel!
    var Villain = villain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if tillNextHero == 0 {
            tillNextHero = resetHeroTimer()
            print(Villain.health)
        }
        updateTurnLabel()
    }
    
    func updateTurnLabel(){
        warningLabel.text = "The Next Hero Will Be Here In \(tillNextHero) Turn(s)!"
    }
    
    func resetHeroTimer()->Int{
        let var1 = arc4random_uniform(3) + 1
        let var2 = arc4random_uniform(3)
        let setup = var1 + var2
        let timer = Int(setup)
        return timer
    }
    
    func checkIfBattle(){
        if (tillNextHero == 0){
                performSegueWithIdentifier("goToBattle", sender: nil)
        }
    }
    
    let player = villain()
    
    @IBAction func onTappedTrainHealth(sender: AnyObject) {
        player.health = player.health + 1
        tillNextHero = tillNextHero - 1
        
        updateTurnLabel()
        checkIfBattle()
    }
    
    @IBAction func onTappedTrainMana(sender: AnyObject) {
        player.mana += 1
        tillNextHero -= 1
        
        updateTurnLabel()
        checkIfBattle()
    }
    
    @IBAction func onTappedTrainAttack(sender: AnyObject) {
        player.attack += 1
        tillNextHero -= 1
        
        updateTurnLabel()
        checkIfBattle()
    }
    
    @IBAction func onTappedTrainMagic(sender: AnyObject) {
        player.magic += 1
        tillNextHero -= 1
        
        updateTurnLabel()
        checkIfBattle()
    }
    
    @IBAction func onTappedTrainDefense(sender: AnyObject) {
        player.defense += 1
        tillNextHero -= 1
        
        updateTurnLabel()
        checkIfBattle()
    }
}
