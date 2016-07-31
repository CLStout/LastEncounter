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
    
    
    //variables for
    var sublabelState = 0
    var labelsArray : [UILabel]!
    var subMenuArray : [UILabel]!
    var mainMenuArray : [UILabel]!
    let player = villain()
    let enemy = villain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subMenuArray = [submenuLabel0, submenuLabel1, submenuLabel2, submenuLabel3]
        mainMenuArray = [attackLabel, magicLabel, itemLabel, statsLabel]
        labelsArray = [attackLabel, magicLabel, itemLabel, statsLabel, submenuLabel0, submenuLabel1, submenuLabel2, submenuLabel3]
        for label in subMenuArray {
            label.hidden = true
        }
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
                            submenuLabel0.text = "Attack 0"
                            submenuLabel1.text = "Attack 1"
                            submenuLabel2.text = "Attack 2"
                            submenuLabel3.text = "Attack 3"
                            sublabelState = 1
                        case magicLabel:
                            print("Magic submenu to open")
                            submenuLabel0.text = "Magic 0"
                            submenuLabel1.text = "Magic 1"
                            submenuLabel2.text = "Magic 2"
                            submenuLabel3.text = "Magic 3"
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
                            submenuLabel0.text = "Stat 0"
                            submenuLabel1.text = "Stat 1"
                            submenuLabel2.text = "Stat 2"
                            submenuLabel3.text = "Stat 3"
                            sublabelState = 0
                        default:
                            print("Something went wrong - menu switch")
                        }
                    }
                }
                print(String(sublabelState))
            }
        }
    }
    
    
    //Functions for attack and magic actions (allows both characters to use them)
    func attackAction (attacker: villain, attacked: villain, type: Int){
            print("\(attacker) attacked \(attacked) : type \(type)")
    }
    
    func magicAction (attacker: villain, attacked: villain, type: Int){
        print("\(attacker) attacked \(attacked) : type \(type)")
    }
    
    
}