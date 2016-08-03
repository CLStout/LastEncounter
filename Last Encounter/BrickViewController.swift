//
//  BrickViewController.swift
//  Last Encounter
//
//  Created by Alex Israelov on 8/3/16.
//  Copyright © 2016 Chris Stout. All rights reserved.
//

import UIKit

class BrickViewController: UIViewController, UICollisionBehaviorDelegate {

    var player = villain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blackColor()
        ball = UIView(frame: CGRectMake(view.center.x, view.center.y, 20, 20))
        ball.backgroundColor = UIColor.whiteColor()
        ball.layer.cornerRadius = 10
        ball.clipsToBounds = true
        view.addSubview(ball)
        //paddle
        paddle = UIView(frame: CGRectMake(view.center.x, view.center.y * 1.7, 80, 20))
        paddle.backgroundColor = UIColor.redColor()
        view.addSubview(paddle)
        //for loop for bricks
        let width = Int(view.center.x * 2)
        let height = Int(view.center.y * 2)
        for j in 0...9{
            let brick = UIView(frame: CGRectMake(CGFloat(j * width / 10), CGFloat(height / 30), CGFloat(38), CGFloat(20)))
            brick.backgroundColor = UIColor.redColor()
            brickArray.append(brick)
            view.addSubview(brick)
        }
        
        //ball physics
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        let ballDynamicBehavior = UIDynamicItemBehavior(items: [ball])
        ballDynamicBehavior.friction = 0
        ballDynamicBehavior.resistance = 0
        ballDynamicBehavior.elasticity = 1
        ballDynamicBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(ballDynamicBehavior)
        
        //paddle physics
        let paddleDynamicBehavior = UIDynamicItemBehavior(items: [paddle])
        paddleDynamicBehavior.density = 10000
        paddleDynamicBehavior.resistance = 100
        paddleDynamicBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(paddleDynamicBehavior)
        
        //brick physics
        let brickDynamicBehavior = UIDynamicItemBehavior(items: brickArray)
        brickDynamicBehavior.density = 10000
        brickDynamicBehavior.resistance = 100
        brickDynamicBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(brickDynamicBehavior)
        
        //push behaviors
        let pushBehavior = UIPushBehavior(items: [ball], mode: .Instantaneous)
        pushBehavior.pushDirection = CGVectorMake(0.2, 1.0)
        pushBehavior.magnitude = 0.25
        dynamicAnimator.addBehavior(pushBehavior)
        
        //set ball collision behavior
        collisionBehavior = UICollisionBehavior(items: [ball, paddle] + brickArray)
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionMode = .Everything
        collisionBehavior.collisionDelegate = self
        dynamicAnimator.addBehavior(collisionBehavior)
        
    }

    @IBAction func dragPaddle(sender: UIPanGestureRecognizer) {
        let panGesture = sender.locationInView(view)
        paddle.center = CGPointMake(panGesture.x, paddle.center.y)
        dynamicAnimator.updateItemUsingCurrentState(paddle)
    }

    //Collision with wall
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, atPoint p: CGPoint) {
        if item.isEqual(ball) && p.y > paddle.center.y {
            if lives > 1{
                lives -= 1
                
                ball.center = view.center
                dynamicAnimator.updateItemUsingCurrentState(ball)
            }
            else{
                
                ball.removeFromSuperview()
                collisionBehavior.removeItem(ball)
                dynamicAnimator.updateItemUsingCurrentState(ball)
                
            }
        }
    }
    
    //Collision with something else
    func collisionBehavior(behavior: UICollisionBehavior, endedContactForItem item1: UIDynamicItem, withItem item2: UIDynamicItem) {
        
        for brick in brickArray{
            if (item1.isEqual(ball) && item2.isEqual(brick)) || (item1.isEqual(brick) && item2.isEqual(ball)){
                if brick.backgroundColor == UIColor.blueColor(){
                    brick.backgroundColor = UIColor.orangeColor()
                } else if brick.backgroundColor == UIColor.orangeColor() {
                    brick.backgroundColor = UIColor.redColor()
                }else {
                    brick.hidden = true
                    collisionBehavior.removeItem(brick)
                    brickCount -= 1
                    if brickCount == 0 {
                        
                        ball.removeFromSuperview()
                        collisionBehavior.removeItem(ball)
                        dynamicAnimator.updateItemUsingCurrentState(ball)
                        
                    }
                }
            }
        }
    }
    
    
}
