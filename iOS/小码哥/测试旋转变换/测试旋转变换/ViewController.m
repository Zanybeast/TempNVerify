//
//  ViewController.m
//  测试旋转变换
//
//  Created by carl on 2020/11/22.
//

#import "ViewController.h"
static int count = 1;
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *customView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.customView.transform = CGAffineTransformMakeRotation(M_PI_4);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [UIView animateWithDuration:1.5 animations:^{
        self.customView.transform = CGAffineTransformMakeRotation(M_PI_4 * (count++));
    }];
}


@end
