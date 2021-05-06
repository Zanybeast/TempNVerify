//
//  ViewController.swift
//  测试锚点
//
//  Created by carl on 2021/1/5.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blueView = UIView()
        blueView.backgroundColor = UIColor.blue
        blueView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        self.view.addSubview(blueView)
        
        let layer = CALayer()
        
        layer.backgroundColor = UIColor.red.cgColor
        
        layer.position = CGPoint(x: 200, y: 200)
        layer.anchorPoint = CGPoint(x: 0, y: 0)
        
        layer.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        self.view.layer.addSublayer(layer)
    }


}

