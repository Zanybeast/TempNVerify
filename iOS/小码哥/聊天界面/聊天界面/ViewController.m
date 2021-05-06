//
//  ViewController.m
//  聊天界面
//
//  Created by carl on 2020/11/20.
//

#import "ViewController.h"
#import "Message.h"
#import "MeCell.h"
#import "OtherCell.h"
#import "MessageCell.h"
#import "MessageCell2.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray* messages;



@end

@implementation ViewController

- (NSMutableArray *)messages {
    if (_messages == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"messages" ofType:@"plist"];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *messagesArray = [NSMutableArray array];
        Message *lastMessage = nil;
        for (NSDictionary *dict in dictArray) {
            Message *message = [Message messageWithDict:dict];
            if (lastMessage == nil) {
                message.timeHidden = false;
            } else {
                message.timeHidden = [message.time isEqualToString:lastMessage.time];
            }
            [messagesArray addObject:message];
            lastMessage = message;
        }
        
        _messages = messagesArray;
    }
    return _messages;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.tableView registerClass:[MeCell class] forCellReuseIdentifier:@"MeCell"];
//    [self.tableView registerClass:[OtherCell class] forCellReuseIdentifier:@"OtherCell"];
//    [self.tableView registerClass:[MessageCell class] forCellReuseIdentifier:@"MessageCell"];
}

#pragma mark - TABLEVIEW DATASOURCE AND DELEGATE
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messages.count;
}

#pragma mark - Use seperate cells to show message
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Message *message = self.messages[indexPath.row];
    
    MessageCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell2" forIndexPath:indexPath];
    
    cell.message = message;
    
    return cell;
    
//    if (message.type == MessageTypeMe) {
//        MeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MeCell" forIndexPath:indexPath];
//        cell.message = message;
//        return cell;
//    } else {
//        OtherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OtherCell" forIndexPath:indexPath];
//        cell.message = message;
//        return cell;
//    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    Message *message = self.messages[indexPath.row];

    return message.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}



@end
