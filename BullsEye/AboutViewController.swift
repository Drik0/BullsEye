//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Gerson Costa on 17/07/2019.
//  Copyright © 2019 Gerson Costa. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let filePath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: filePath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }

    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
