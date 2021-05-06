//
//  SecondViewController.h
//  测试反向传值
//
//  Created by carl on 2020/12/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^PassBlock)(NSString *text);

@interface SecondViewController : UIViewController

-(void)passValueUsingBlock: (PassBlock)passBlock;

@end

NS_ASSUME_NONNULL_END
