//
//  ViewController.swift
//  Raybreak
//
//  Created by carl on 2020/11/6.
//

import UIKit
import MetalKit

enum Colors {
    static let wenderlichGreen = MTLClearColorMake(0.0, 0.4, 0.21, 1.0)
}

class ViewController: UIViewController {
    
    var metalView: MTKView {
        return view as! MTKView
    }
    
    var device: MTLDevice!
    var commandQueue: MTLCommandQueue!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        metalView.device = MTLCreateSystemDefaultDevice()
        device = metalView.device
        
        metalView.clearColor = Colors.wenderlichGreen
        
        commandQueue = device.makeCommandQueue()
        
    }

}

