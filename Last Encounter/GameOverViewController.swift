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
    @IBOutlet weak var heroesDefeatedLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var magicLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var manaLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    var background : AVAudioPlayer?
    var player = villain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heroesDefeatedLabel.text = "Number Of Heroes Defeated: \(player.heroesKilled)"
        levelLabel.text = "Final Level: \(player.level)"
        magicLabel.text = "Magic: \(player.magic)"
        healthLabel.text = "Health: \(player.health)"
        manaLabel.text = "Mana: \(player.mana)"
        defenseLabel.text = "Defense \(player.defense)"
        attackLabel.text = "Attack: \(player.attack)"
        
        let path = NSBundle.mainBundle().pathForResource("Lose.wav", ofType:nil)!
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
