//
//  equipViewController.swift
//  Last Encounter
//
//  Created by Alex Israelov on 8/1/16.
//  Copyright © 2016 Chris Stout. All rights reserved.
//

import UIKit

class equipViewController: UIViewController {

    var player = villain()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            let dvc = segue.destinationViewController as! WaitingViewController
            dvc.player = self.player
        }
}
