//
//  ViewController.swift
//  Last Encounter
//
//  Created by Stanley Stout on 7/29/16.
//  Copyright © 2016 Chris Stout. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var magicLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var statsLabel: UILabel!
    @IBOutlet weak var submenuLabel0: UILabel!
    @IBOutlet weak var submenuLabel1: UILabel!
    @IBOutlet weak var submenuLabel2: UILabel!
    @IBOutlet weak var submenuLabel3: UILabel!
    @IBOutlet weak var menuView: UIView!
    
    var labelsArray : [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelsArray = [attackLabel, magicLabel, itemLabel, statsLabel, submenuLabel0, submenuLabel1, submenuLabel2, submenuLabel3]
        submenuLabel0.hidden = true
        submenuLabel1.hidden = true
        submenuLabel2.hidden = true
        submenuLabel3.hidden = true
    }
    
    @IBAction func onTappedBattleMenu(sender: UITapGestureRecognizer) {
        for label in labelsArray{
            if CGRectContainsPoint(label.frame, sender.locationInView(menuView)) {
                
            }
        }
    }
    
}

