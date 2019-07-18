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
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewRound()
        let thumbImage = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImage, for: .normal)
        slider.setThumbImage(#imageLiteral(resourceName: "SliderThumb-Highlighted"), for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizeable = trackLeftImage.resizableImage(withCapInsets: insets)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizeable = trackRightImage.resizableImage(withCapInsets: insets)
        
        slider.setMinimumTrackImage(trackLeftResizeable, for: .normal)
        slider.setMaximumTrackImage(trackRightResizeable, for: .normal)
    }
    
    func startNewRound() {
        currentValue = 50
        targetValue = Int.random(in: 1...100)
        slider.value = Float(currentValue)
        
        round += 1
        
        updateLabels()
    }
    
    func updateLabels() {
        targetValueLabel.text = "\(targetValue)"
        scoreLabel.text = "\(score)"
        roundLabel.text = "\(round)"
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        let difference: Int = abs(targetValue - currentValue)
        
        var points: Int {
            var points = 100 - difference
            
            switch difference {
                case 0:
                    points += 100
                case 1:
                    points += 50
                default:
                    break
            }
            
            return points
        }
        
        score += points
        
        var title: String = ""
        
        if difference == 0 {
            title = "Perfect"
        } else if difference < 5 {
            title = "You almost had it"
        } else if difference < 10 {
            title = "Pretty Good"
        } else if difference < 5 {
            title = "Not even close"
        }
        
        let alert = UIAlertController(title: title, message: "You've scored \(points) points", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.startNewRound()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        currentValue = Int(sender.value.rounded())
    }
    @IBAction func restartBtnPressed(_ sender: UIButton) {
        round = 0
        score = 0
        startNewRound()
    }
}

