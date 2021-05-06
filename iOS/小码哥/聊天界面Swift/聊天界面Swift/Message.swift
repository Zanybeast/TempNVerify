//
//  Message.swift
//  聊天界面Swift
//
//  Created by carl on 2020/11/21.
//

import UIKit

enum MessageType: Int {
    case me = 0
    case other = 1
}

class Message: NSObject {
    var text: String!
    var time: String!
    var type: Int!
    
    var cellHeight: CGFloat!
    
    var timeHidden: Bool!
    
    init(with dictionary: [String: Any]?) {
        super .init()
        
        guard let dict = dictionary else {
            return
        }
        
        self.text = (dict["text"] as! String)
        self.time = (dict["time"] as! String)
        self.type = (dict["type"] as! Int)
    }

}

