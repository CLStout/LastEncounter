//
//  ViewController6side.swift
//  Randomizer
//
//  Created by Zachary Rutherford on 7/25/16.
//  Copyright © 2016 Zachary Rutherford. All rights reserved.
//

import UIKit

class DiceViewController: UIViewController {
    
    
    
    @IBOutlet weak var sixCount: UILabel!
    @IBOutlet weak var fiveCount: UILabel!
    @IBOutlet weak var fourCount: UILabel!
    @IBOutlet weak var threeCount: UILabel!
    @IBOutlet weak var twoCount: UILabel!
    @IBOutlet weak var oneCount: UILabel!
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
    
    
    func toss (){
        let chance = Int(arc4random_uniform(6))
        if chance == 0{
            resultImageView.image = UIImage (named: ("one face"))
            one = one + 1
        }
        else if chance == 1{
            resultImageView.image = UIImage (named: ("two face"))
            two = two + 1
        }
        else if chance == 2{
            resultImageView.image = UIImage (named: ("three face"))
            three = three + 1
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
    }
    
    @IBAction func onTappedRollButton(sender: AnyObject) {
        toss()
        oneCount.text = "\(one)"
        twoCount.text = "\(two)"
        threeCount.text = "\(three)"
        fourCount.text = "\(four)"
        fiveCount.text = "\(five)"
        sixCount.text = "\(six)"
        
    }
}


