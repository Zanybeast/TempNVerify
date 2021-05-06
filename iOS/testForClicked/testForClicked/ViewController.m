//
//  ViewController.m
//  testForClicked
//
//  Created by carl on 2021/5/5.
//

#import "ViewController.h"
#import "CustomCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[CustomCell class] forCellReuseIdentifier:@"Cell"];
}

#pragma mark - TABLEVIEW DELEGATE AND DATASOURCE
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
//    cell.backgroundColor = [UIColor blueColor];
//    UIView *seperateView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, 10)];
//    seperateView.backgroundColor = [UIColor grayColor];
//    [cell addSubview:seperateView];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 260;
}

@end
