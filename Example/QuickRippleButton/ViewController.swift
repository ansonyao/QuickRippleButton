//
//  ViewController.swift
//  QuickRippleButton
//
//  Created by Anson Yao on 11/01/2016.
//  Copyright (c) 2016 Anson Yao. All rights reserved.
//

import UIKit
import QuickRippleButton

class ViewController: UIViewController {
    @IBOutlet weak var sampleButton: QuickRippleButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        sampleButton.tintColor = UIColor.blue
    }

}

