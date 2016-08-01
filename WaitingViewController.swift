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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if tillNextHero == 0 {
            tillNextHero = resetHeroTimer()
        }
        warningLabel.text = "The Next Hero Will Be Here In \(tillNextHero) Turn(s)!"
    }
    
    func resetHeroTimer()->Int{
        let var1 = arc4random_uniform(2) + 1
        let var2 = arc4random_uniform(2)
        let setup = var1 + var2
        let timer = Int(setup)
        return timer
    }
    
    
}
