//
//  BRTextAlertTableViewController.m
//  BRAlertView
//
//  Created by sjwu on 2016/11/2.
//  Copyright © 2016年 brant. All rights reserved.
//

#import "BRTextAlertTableViewController.h"
#import "BRTextAlertView.h"
#import "BRCopyShareAlertView.h"
#import "BRImageTextAlertView.h"

NS_ASSUME_NONNULL_BEGIN
@interface BRTextAlertTableViewController ()

@end

@implementation BRTextAlertTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0: {
            
            [BRTextAlertView showInView:self.view message:@"Tap outside can't dismiss" buttonTitles:@[@"Cancel"] configrationBlock:^BRTextConfigration *{
                BRTextConfigration *conf = [BRTextConfigration new];
                conf.tapOutsideDismiss = NO;
                return conf;
            } actionBlock:^(int index) {
                
            }];
            
            break;
        }
            
        case 1: {
            [BRTextAlertView showInView:self.view message:@"Tap outside dismiss" buttonTitles:@[@"Cancel", @"Confirm"] configrationBlock:^BRTextConfigration *{
                BRTextConfigration *conf = [BRTextConfigration new];
                return conf;
            } actionBlock:^(int index) {
                
            }];
            break;
        }
        case 2: {
            [BRCopyShareAlertView showInView:self.view message:@"仿淘宝天猫的复制粘贴分享" actionBlock:^(int index) {
                
            }];
            break;
        }
        case 3: {
            [BRImageTextAlertView showInView:self.view message:@"这个信息可以多行的，这个alertview可以高度定制，子类化也比较简单" image:[UIImage imageNamed:@"timg"] actionBlock:^(int index) {
                
            }];
            break;
        }
            
        default:
            break;
    }
}

@end

NS_ASSUME_NONNULL_END
