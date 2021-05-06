//
//  MessageCell.h
//  聊天界面
//
//  Created by carl on 2020/11/20.
//

#import <UIKit/UIKit.h>
#import "Message.h"

NS_ASSUME_NONNULL_BEGIN

@interface MessageCell : UITableViewCell

@property (strong, nonatomic) Message *message;

@end

NS_ASSUME_NONNULL_END
