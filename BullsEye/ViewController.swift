//
//  ViewController.swift
//  BullsEye
//
//  Created by Gerson Costa on 09/07/2019.
//  Copyright © 2019 Gerson Costa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func showAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: "Hello World!", message: "This is my first app!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Awesome!", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

