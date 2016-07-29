//
//  Villain.swift
//  Last Encounter
//
//  Created by Stanley Stout on 7/29/16.
//  Copyright © 2016 Chris Stout. All rights reserved.
//

import UIKit

class Villain: NSObject {

    var health : Int = 10
    var mana : Int = 10
    var attack : Int = 10
    var magic : Int = 10
    var defense : Int = 10
    var exp : Int = 0
    var level : Int
    
    override init(){
        level = (health + mana + attack + magic + defense) - 59 // remove 50 points for initial stats, remove 9 points bc you get 10 free levels @ the start (so you start @ level 1)
        
    }
}
