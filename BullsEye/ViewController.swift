//
//  ViewController.swift
//  BullsEye
//
//  Created by joy on 8/12/16.
//  Copyright © 2016 JanL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var currentValue = 50
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
    }


    @IBAction func showAlert(sender: UIButton) {
        
        let difference = abs(currentValue - targetValue)
        let points = 100 - difference
        score += points
        
        
        
        
//        if difference < 0 {
//            difference *= -1
            // difference = difference * -1
//          difference = -difference }
    
//        if currentValue > targetValue {
//            difference = currentValue - targetValue
//        } else if currentValue < targetValue  {
//            difference = targetValue - currentValue
//        } else {
//            difference = 0
//        }
        
        let message = "You scored \(points) points!"
        
        
        let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
        startNewRound()
        updateLabels()
        
    }

    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }

    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        //currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        // alternative way to code the above
        // targetLabel.text = "\(targetValue)"
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        
    }
    
    
}

