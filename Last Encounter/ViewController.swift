//
//  ViewController.swift
//  Last Encounter
//
//  Created by Chris Stout on 7/29/16.
//  Copyright © 2016 Chris Stout. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //Outlets for labels in the action menu and status labels
    
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var magicLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var statsLabel: UILabel!
    @IBOutlet weak var submenuLabel0: UILabel!
    @IBOutlet weak var submenuLabel1: UILabel!
    @IBOutlet weak var submenuLabel2: UILabel!
    @IBOutlet weak var submenuLabel3: UILabel!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerHealthLabel: UILabel!
    @IBOutlet weak var playerManaLabel: UILabel!
    @IBOutlet weak var enemyNameLabel: UILabel!
    @IBOutlet weak var enemyHealthLabel: UILabel!
    @IBOutlet weak var enemyManaLabel: UILabel!
    
    
    
    
    
    //variables for
    var sublabelState = 0
    var labelsArray : [UILabel]!
    var subMenuArray : [UILabel]!
    var mainMenuArray : [UILabel]!
    var enoughMana = true
    var player = villain()
    var enemy = villain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subMenuArray = [submenuLabel0, submenuLabel1, submenuLabel2, submenuLabel3]
        mainMenuArray = [attackLabel, magicLabel, itemLabel, statsLabel]
        labelsArray = [attackLabel, magicLabel, itemLabel, statsLabel, submenuLabel0, submenuLabel1, submenuLabel2, submenuLabel3]
        
        let rounds = player.health + player.mana + player.attack + player.defense + player.magic - 50
        for _ in 0...rounds{
            let enemyBoost = arc4random_uniform(5)
            switch enemyBoost{
            case 0:
                enemy.health += 1
                print("Health added")
            case 1:
                enemy.mana += 1
                print("Mana added")
            case 2:
                enemy.attack += 1
                print("Attack added")
            case 3:
                enemy.magic += 1
                print("Magic added")
            case 4:
                enemy.defense += 1
                print("Defense added")
            default:
                print("Something went wrong - enemy stat switch")
            }
        }
        
        for label in subMenuArray {
            label.hidden = true
        }
        playerHealthLabel.text = String(player.health)
        enemyHealthLabel.text = String(enemy.health)
        playerManaLabel.text = String(player.mana)
        enemyManaLabel.text = String(enemy.mana)
    }
    
    //Menu code
    @IBAction func onTappedBattleMenu(sender: UITapGestureRecognizer) {
        for label in labelsArray{
            if CGRectContainsPoint(label.frame, sender.locationInView(menuView)) {
                print("Label \(label.text) tapped")
                if sublabelState != 0 {
                    for s in subMenuArray{
                        if label == s {
                            print("Submenu label tapped")
                            switch s {
                            case submenuLabel0:
                                print("Submenu 0")
                                switch sublabelState {
                                case 1:
                                    print("Attack 0")
                                    attackAction(player, attacked: enemy, type: 0)
                                case 2 :
                                    print("Magic 0")
                                    magicAction(player, attacked: enemy, type: 0)
                                case 3:
                                    print("Item 0")
                                case 4:
                                    print("Stat 0")
                                default:
                                    print("Something went wrong - sub 0 switch")
                                }
                            case submenuLabel1:
                                print("Submenu1")
                                print("Submenu 1")
                                switch sublabelState {
                                case 1:
                                    print("Attack 1")
                                    attackAction(player, attacked: enemy, type: 1)
                                case 2 :
                                    print("Magic 1")
                                    magicAction(player, attacked: enemy, type: 1)
                                case 3:
                                    print("Item 1")
                                case 4:
                                    print("Stat 1")
                                default:
                                    print("Something went wrong - sub 1 switch")
                                }
                            case submenuLabel2:
                                print("Submenu2")
                                switch sublabelState {
                                case 1:
                                    print("Attack 2")
                                    attackAction(player, attacked: enemy, type: 2)
                                case 2 :
                                    print("Magic 2")
                                    magicAction(player, attacked: enemy, type: 2)
                                case 3:
                                    print("Item 2")
                                case 4:
                                    print("Stat 2")
                                default:
                                    print("Something went wrong - sub 2 switch")
                                }
                            case submenuLabel3:
                                print("Submenu3")
                                switch sublabelState {
                                case 1:
                                    print("Attack 3")
                                    attackAction(player, attacked: enemy, type: 3)
                                case 2 :
                                    print("Magic 3")
                                    magicAction(player, attacked: enemy, type: 3)
                                case 3:
                                    print("Item 3")
                                case 4:
                                    print("Stat 3")
                                default:
                                    print("Something went wrong - sub 3 switch")
                                }
                            default:
                                print("Something went wrong - sub selector switch")
                            }
                            //Enemy attacks upon action (Determined by RNG)
                            if sublabelState != 0 {
                                if enoughMana == true {
                                    let aiTurn = arc4random_uniform(8)
                                    switch aiTurn{
                                    case 0:
                                        attackAction(enemy, attacked: player, type: 0)
                                    case 1:
                                        attackAction(enemy, attacked: player, type: 1)
                                    case 2:
                                        attackAction(enemy, attacked: player, type: 2)
                                    case 3:
                                        attackAction(enemy, attacked: player, type: 3)
                                    case 4:
                                        if enemy.mana >= 2{
                                            magicAction(enemy, attacked: player, type: 0)
                                        }else{
                                            attackAction(enemy, attacked: player, type: 0)
                                        }
                                    case 5:
                                        if enemy.mana >= 4{
                                            magicAction(enemy, attacked: player, type: 1)
                                        }else{
                                            attackAction(enemy, attacked: player, type: 1)
                                        }
                                    case 6:
                                        if enemy.mana >= 6{
                                            magicAction(enemy, attacked: player, type: 2)
                                        }else{
                                            attackAction(enemy, attacked: player, type: 2)
                                        }
                                    case 7:
                                        if enemy.mana >= 4{
                                            magicAction(enemy, attacked: player, type: 3)
                                        }else{
                                            attackAction(enemy, attacked: player, type: 3)
                                        }
                                    default:
                                        print("Something went wrong - AI Switch")
                                    }
                                }else {
                                    enoughMana = true
                                }
                            }
                        }
                    }
                }
                for m in mainMenuArray {
                    if label == m {
                        for s in subMenuArray {
                            s.hidden = false
                        }
                        switch m {
                        case attackLabel:
                            print("Attack submenu to open")
                            submenuLabel0.text = "Bash"
                            submenuLabel1.text = "Stab"
                            submenuLabel2.text = "Swing"
                            submenuLabel3.text = "Pierce"
                            sublabelState = 1
                        case magicLabel:
                            print("Magic submenu to open")
                            submenuLabel0.text = "Wind-2"
                            submenuLabel1.text = "Light-4"
                            submenuLabel2.text = "Fire-6"
                            submenuLabel3.text = "Water-4"
                            sublabelState = 2
                        case itemLabel:
                            print("Item submenu to open")
                            submenuLabel0.text = "Item 0"
                            submenuLabel1.text = "Item 1"
                            submenuLabel2.text = "Item 2"
                            submenuLabel3.text = "Item 3"
                            sublabelState = 3
                        case statsLabel:
                            print("Stats submenu to open")
                            submenuLabel0.text = "Att: \(player.attack)"
                            submenuLabel1.text = "Mag: \(player.magic)"
                            submenuLabel2.text = "Def: \(player.defense)"
                            submenuLabel3.text = ""
                            sublabelState = 0
                        default:
                            print("Something went wrong - menu switch")
                        }
                    }
                }
                print(String(sublabelState))
                playerManaLabel.text = String(player.mana)
                enemyManaLabel.text = String(enemy.mana)
                playerHealthLabel.text = String(player.health)
                enemyHealthLabel.text = String(enemy.health)
                if enemy.health <= 0 {
                    playerWins()
                } else if player.health <= 0 {
                    playerLose()
                }else{
                    print("Rewrite the in game health/mana display")
                }
            }
        }
    }
    
    
    //Functions for attack and magic actions (allows both characters to use them)
    func attackAction (attacker: villain, attacked: villain, type: Double){
        print("\(attacker) attacked \(attacked) : type \(type)")
        let hitChance = arc4random_uniform(UInt32(type) + 4)
        var damage = 0.0
        if hitChance <= 4 {
            switch type {
            case 0:
                damage = Double(attacker.attack) * 0.8 - Double(attacked.defense) * 0.6
            case 1:
                damage = Double(attacker.attack) * 0.6 - Double(attacked.defense) * 0.2
            case 2:
                damage = Double(attacker.attack) * 0.9 - Double(attacked.defense) * 0.4
            case 3:
                damage = Double(attacker.attack)  - Double(attacked.defense) * 0.1
            default:
                print("Something went wrong - attack switch")
            }
            attacked.health -= Int(damage)
        } else {
            print("Missed")
        }
        print("Player HP: \(String(player.health))")
        print("Enemy HP: \(String(enemy.health))")
    }
    
    func magicAction (attacker: villain, attacked: villain, type: Int){
        print("\(attacker) attacked \(attacked) : type \(type)")
        enoughMana = true
        var damage = 0.0
        switch type {
        case 0:
            if attacker.mana >= 2{
                attacker.mana -= 2
                damage = Double(attacker.magic) * 0.5 - Double(attacked.defense) * 0.2
            }else{
                enoughMana = false
            }
        case 1:
            if attacker.mana >= 4{
                attacker.mana -= 4
                damage = Double(attacker.magic) * 0.7 - Double(attacked.defense) * 0.2
            }else{
                enoughMana = false
            }
        case 2:
            if attacker.mana >= 6{
                attacker.mana -= 6
                damage = Double(attacker.magic) * 0.9 - Double(attacked.defense) * 0.2
            }else{
                enoughMana = false
            }
        case 3:
            if attacker.mana >= 4{
                attacker.mana -= 4
                attacker.health += attacker.magic * 6 / 10
            }else{
                enoughMana = false
            }
        default:
            print("Something went wrong - magic switch")
        }
        attacked.health -= Int(damage)
        print("Player HP: \(String(player.health))")
        print("Enemy HP: \(String(enemy.health))")
        print("Player MP: \(String(player.mana))")
        print("Enemy MP: \(String(enemy.mana))")
    }
    
    //functions to be finished later - Segue for game over or for victory
    //called when player or enemy HP hits 0
    
    func playerLose() {
        print("You lose")
    }
    
    func playerWins(){
        print("You win")
    }
}