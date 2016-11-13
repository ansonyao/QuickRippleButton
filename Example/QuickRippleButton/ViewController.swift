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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sampleButton: QuickRippleButton!

    let messages = [1, 2, 3, 4, 5, 6, 7, 8]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sampleButton.tintColor = Constants.redColor
        tableView.dataSource = self
        tableView.delegate = self
        navigationController?.navigationBar.barTintColor = Constants.redColor
        
        let topRightButton = QuickRippleButton(frame: CGRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0))
        topRightButton.setImage(UIImage(named: "ic_search"), for: UIControlState.normal)
        topRightButton.initalSizeFactor = 0.5
        topRightButton.duration = 0.3
        let rightNavButtonItem = UIBarButtonItem(customView: topRightButton)
        navigationItem.rightBarButtonItem = rightNavButtonItem
        

    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "CellIdentifier")
        }
        cell?.textLabel?.text = String(messages[indexPath.row])
        return cell!
    }
}

extension ViewController: UITableViewDelegate {}
