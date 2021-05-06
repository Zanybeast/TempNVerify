//
//  MeCell.m
//  聊天界面
//
//  Created by carl on 2020/11/20.
//

#import "MeCell.h"
#import "Masonry.h"

@interface MeCell ()

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIImageView *meAvator;

@property (weak, nonatomic) IBOutlet UIButton *messageButton;

@end

@implementation MeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _messageButton.titleLabel.numberOfLines = 0;
}

- (void)setMessage:(Message *)message {
    _message = message;
    
    if (message.isTimeHidden) {
        _timeLabel.hidden = YES;
    } else {
        _timeLabel.hidden = NO;
        _timeLabel.text = message.time;
    }
    
    [_messageButton setTitle:message.text forState:UIControlStateNormal];
    
    [_messageButton layoutIfNeeded];
    
    [_meAvator mas_updateConstraints:^(MASConstraintMaker *make) {
        CGFloat height = self.messageButton.titleLabel.frame.size.height + 30;
        make.height.mas_equalTo(height);
    }];
    
    NSLog(@"buttonHeight: %f", _messageButton.frame.size.height);
    
    [_messageButton layoutIfNeeded];
    
    CGFloat avatorY = CGRectGetMaxY(self.meAvator.frame);
    CGFloat messageY = CGRectGetMaxY(self.messageButton.frame);
    
    NSLog(@"avatorY: %f messageY: %f", avatorY, messageY);
    
    CGFloat cellHeight = MAX(avatorY, messageY);
    
    message.cellHeight = cellHeight;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
