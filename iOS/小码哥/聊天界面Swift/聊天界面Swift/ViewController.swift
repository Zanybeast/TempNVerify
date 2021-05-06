//
//  ViewController.swift
//  聊天界面Swift
//
//  Created by carl on 2020/11/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var messages: [Message] = {
        let path = Bundle.main.path(forResource: "messages", ofType: "plist")
        let dictArray = NSArray(contentsOfFile: path!)
        let data = NSMutableArray()
        
        var lastMessage: Message?
        
        for dict in dictArray! {
            var message = Message(with: (dict as! [String: Any]))
            
            if lastMessage == nil {
                message.timeHidden = false
            } else {
                message.timeHidden = (message.time == lastMessage!.time) ? true : false
            }
            
            data.add(message)
        }
        
        return data as! [Message]
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "MessageCell2", bundle: nil), forCellReuseIdentifier: "Cell")
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MessageCell2
        
        let message = messages[indexPath.row]
        
        cell.message = message
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 350
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let message = messages[indexPath.row];

        return message.cellHeight ?? 0
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

