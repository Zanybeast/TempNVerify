//
//  MyLabel.m
//  聊天界面
//
//  Created by carl on 2020/11/20.
//

#import "MyLabel.h"

@implementation MyLabel

- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = UIEdgeInsetsMake(15, 15, 15, 15);
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
