//
//  ViewController.swift
//  BullsEye
//
//  Created by joy on 8/12/16.
//  Copyright © 2016 JanL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var currentValue: Int = 50
    var targetValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
    }


    @IBAction func showAlert(sender: UIButton) {
        
        let difference: Int
        if currentValue > targetValue {
            difference = currentValue - targetValue
        } else if targetValue > currentValue {
            difference = targetValue - currentValue
        } else {
            difference = 0
        }
        
        let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)" + "\nThe difference is: \(difference)"
        
        
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
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        // alternative way to code the above
        // targetLabel.text = "\(targetValue)"
    }
    
    
}

