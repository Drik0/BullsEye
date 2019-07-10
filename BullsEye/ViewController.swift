//
//  ViewController.swift
//  BullsEye
//
//  Created by Gerson Costa on 09/07/2019.
//  Copyright © 2019 Gerson Costa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewRound()
    }


    @IBAction func showAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: "Hello World!", message: "The value of the slider is now \(currentValue)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Awesome", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        currentValue = Int(sender.value.rounded())
    }
    
    func startNewRound() {
        currentValue = 50
        targetValue = Int.random(in: 1...100)
        slider.value = Float(currentValue)
        
        updateLabels()
    }
    
    func updateLabels() {
        targetValueLabel.text = "\(targetValue)"
    }
}

