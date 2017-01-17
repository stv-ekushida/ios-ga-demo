//
//  ViewController.swift
//  ios-ga-demo
//
//  Created by Eiji Kushida on 2017/01/17.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        sendScreenName("TOP画面")
    }
    
    @IBAction func didTapButton(sender: UIButton) {
        sendEvent("TOP", action: "tap", label: "tracking", value: 1)
    }
}

