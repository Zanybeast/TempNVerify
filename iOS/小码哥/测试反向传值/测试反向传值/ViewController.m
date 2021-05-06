//
//  ViewController.m
//  测试反向传值
//
//  Created by carl on 2020/12/4.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *toButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)toSecond:(UIButton *)sender {
    SecondViewController *sVC = [[SecondViewController alloc] init];
    [self presentViewController:sVC animated:YES completion:nil];
    [sVC passValueUsingBlock:^(NSString * _Nonnull text) {
        self.label.text = text;
    }];
}

@end
