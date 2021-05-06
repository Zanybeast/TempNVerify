//
//  MessageCell.swift
//  聊天界面Swift
//
//  Created by carl on 2020/11/21.
//

import UIKit

class MessageCell: UITableViewCell {
    
    var message: Message! {
        
        didSet {
            if message.timeHidden == true {
                self.timeLabel.isHidden = true
            } else {
                self.timeLabel.isHidden = false
                self.timeLabel.text = message.time
            }
            
            if message.type == MessageType.me.rawValue {
                process(showAvator: meAvator, showButton: meButton, hideAvator: otherAvator, hideButton: otherButton)
            } else {
                process(showAvator: otherAvator, showButton: otherButton, hideAvator: meAvator, hideButton: meButton)
            }
        }
    }

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var otherAvator: UIImageView!
    @IBOutlet weak var otherButton: UIButton!
    
    @IBOutlet weak var meAvator: UIImageView!
    @IBOutlet weak var meButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        meButton.titleLabel?.numberOfLines = 0
        otherButton.titleLabel?.numberOfLines = 0
    }
    
    func process(showAvator: UIImageView, showButton: UIButton, hideAvator: UIImageView, hideButton: UIButton) {
        hideAvator.isHidden = true
        hideButton.isHidden = true
        
        showAvator.isHidden = false
        showButton.isHidden = false
        
        showButton.setTitle(self.message.text, for: .normal)
        
        showButton.sizeToFit()
        
        let avatorY = showAvator.frame.maxY
        let buttonY = showButton.frame.maxY
        
        let cellHeight = max(avatorY, buttonY)
        
        self.message.cellHeight = cellHeight
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
