//
//  SecondViewController.m
//  测试反向传值
//
//  Created by carl on 2020/12/4.
//

#import "SecondViewController.h"



@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)backClicked:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    NSString *result = self.textField.text;
    
    [self passValueUsingBlock:^(NSString *text){
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
