//
//  MessageCell2.swift
//  聊天界面Swift
//
//  Created by carl on 2020/11/21.
//

import UIKit

class MessageCell2: UITableViewCell {
    
    var message: Message! {
        didSet {
            timeLabel.text = message.time
            messageLabel.text = message.text
            print("messageLabel Height: \(messageLabel.intrinsicContentSize.height), background intrinsicContentSize Height: \(messageBg.intrinsicContentSize.height), background frame Y: \(messageBg.frame.maxY), background frame Height: \(messageBg.frame.size.height)")
            var labelHeight = messageLabel.intrinsicContentSize.height
            
            if labelHeight < 50 {
                labelHeight = 50
            }
            self.message.cellHeight = labelHeight + 60
        }
    }

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageBg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
