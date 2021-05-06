//
//  ViewController.swift
//  test
//
//  Created by carl on 2020/11/1.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let centerLabel = UILabel()
        centerLabel.text = "Perfectly centered!"
        view.addSubview(centerLabel)

        NSLayoutConstraint.activate([
          centerLabel.centerXAnchor.constraint(
            equalTo: view.centerXAnchor, constant: 0),
          centerLabel.centerYAnchor.constraint(
            equalTo: view.centerYAnchor, constant: 0)
          ])
    }


}

