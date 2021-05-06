//
//  MessageCell2.m
//  聊天界面
//
//  Created by carl on 2020/11/20.
//

#import "MessageCell2.h"
#import "Masonry.h"
#import "MyLabel.h"

@interface MessageCell2 ()

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIImageView *meAvator;
@property (weak, nonatomic) IBOutlet MyLabel *meMessage;
@property (weak, nonatomic) IBOutlet UIImageView *meBackground;

@property (weak, nonatomic) IBOutlet UIImageView *otherAvator;
@property (weak, nonatomic) IBOutlet MyLabel *otherMessage;
@property (weak, nonatomic) IBOutlet UIImageView *otherBackground;

@end

@implementation MessageCell2

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setMessage:(Message *)message {
    _message = message;
    
    if (message.isTimeHidden) {
        self.timeLabel.hidden = YES;
    } else {
        self.timeLabel.hidden = NO;
        self.timeLabel.text = message.time;
    }
    
    if (message.type == MessageTypeMe) {
        [self viewShowAvator:self.meAvator showMessage:self.meMessage showBackground:self.meBackground
                  hideAvator:self.otherAvator hideMessage:self.otherMessage hideBackground:self.otherBackground];
    } else {
        [self viewShowAvator:self.otherAvator showMessage:self.otherMessage showBackground:self.otherBackground
                  hideAvator:self.meAvator hideMessage:self.meMessage hideBackground:self.meBackground];
    }
    
}

- (void)viewShowAvator: (UIImageView *)showAvator showMessage: (MyLabel *)showLabel showBackground: (UIImageView *)showBg
            hideAvator: (UIImageView *)hideAvator hideMessage: (MyLabel *)hideLabel hideBackground: (UIImageView *)hideBg {
    hideAvator.hidden = YES;
    hideBg.hidden = YES;
    hideLabel.hidden = YES;
    
    showAvator.hidden = NO;
    showLabel.hidden = NO;
    showBg.hidden = NO;
    
    showLabel.text = self.message.text;
    
    [self layoutIfNeeded];
    
    CGFloat labelY = CGRectGetMaxY(showLabel.frame);
    CGFloat avatorY = CGRectGetMaxY(showAvator.frame);
    
    CGFloat cellHeight = MAX(labelY, avatorY);
    
    self.message.cellHeight = cellHeight + 10;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
