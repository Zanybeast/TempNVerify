//
//  MessageCell.m
//  聊天界面
//
//  Created by carl on 2020/11/20.
//

#import "MessageCell.h"
#import "Masonry.h"

@interface MessageCell ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIImageView *meAvator;
@property (weak, nonatomic) IBOutlet UIButton *meMessage;

@property (weak, nonatomic) IBOutlet UIImageView *otherAvator;
@property (weak, nonatomic) IBOutlet UIButton *otherMessage;

@end

@implementation MessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.meMessage.titleLabel.numberOfLines = 0;
    self.otherMessage.titleLabel.numberOfLines = 0;
}

- (void)setMessage:(Message *)message {
    _message = message;
    
    if (message.isTimeHidden) {
        self.timeLabel.hidden = YES;
//        [self.timeLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(0);
//        }];
        [self.timeLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
    } else {
        self.timeLabel.hidden = NO;
        self.timeLabel.text = message.time;
        [self.timeLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(20);
        }];
    }
    
    if (message.type == MessageTypeMe) {
        [self showAvator:self.meAvator hideAvator:self.otherAvator showMessage:self.meMessage hideButton:self.otherMessage];
    } else {
        [self showAvator:self.otherAvator hideAvator:self.meAvator showMessage:self.otherMessage hideButton:self.meMessage];
    }
}

- (void)showAvator: (UIImageView *)showAvator hideAvator: (UIImageView *)hideAvator
       showMessage: (UIButton *)showButton hideButton: (UIButton *)hideButton {
    hideAvator.hidden = YES;
    hideButton.hidden = YES;
    
    showAvator.hidden = NO;
    showButton.hidden = NO;
    
    [showButton setTitle:self.message.text forState:UIControlStateNormal];
    
    [showButton layoutIfNeeded];
    
    [showButton mas_updateConstraints:^(MASConstraintMaker *make) {
        CGFloat height = showButton.titleLabel.frame.size.height + 30;
        make.height.mas_equalTo(height);
    }];
    
    [showButton layoutIfNeeded];
    
    CGFloat buttonY = CGRectGetMaxY(showButton.frame);
    CGFloat avatorY = CGRectGetMaxY(showAvator.frame);
    
    CGFloat cellHeight = MAX(buttonY, avatorY);
    
    self.message.cellHeight = cellHeight + 5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
