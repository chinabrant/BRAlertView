//
//  BRTextAlertTableViewController.m
//  BRAlertView
//
//  Created by sjwu on 2016/11/2.
//  Copyright © 2016年 brant. All rights reserved.
//

#import "BRTextAlertTableViewController.h"
#import "BRTextAlertView.h"

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
            [BRTextAlertView showMessage:@"Tap outside can't dismiss" buttonTitles:@[@"Cancel"] configrationBlock:^BRTextConfigration * _Nullable{
                BRTextConfigration *configration = [BRTextConfigration new];
                configration.tapOutsideDismiss = NO;
                return configration;
            } actionBlock:^(int index) {
                
            }];
            break;
        }
        case 1: {
            [BRTextAlertView showMessage:@"Tap outside dismiss" buttonTitles:@[@"Cancel", @"Confirm"] configrationBlock:^BRTextConfigration * _Nullable{
                BRTextConfigration *configration = [BRTextConfigration new];
                
                return configration;
            } actionBlock:^(int index) {
                
            }];
            break;
        }
        case 2: {
            [BRTextAlertView showMessage:@"Tap outside dismiss" buttonTitles:@[@"Cancel", @"Confirm"] configrationBlock:^BRTextConfigration * _Nullable{
                BRTextConfigration *configration = [BRTextConfigration new];
                NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"This is an AttributedString,Configration contain attributedString,the message parameter will invalid!"];
                [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(4, 16)];
                NSRange range = [[attrString string] rangeOfString:@"invalid"];
                [attrString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:17] range:range];
                [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
                configration.attributedString = attrString;
                
                return configration;
            } actionBlock:^(int index) {
                
            }];
            break;
        }
        case 3: {
            [BRTextAlertView showMessage:@"customize button" buttonTitles:@[@"Cancel"] configrationBlock:^BRTextConfigration * _Nullable{
                BRTextConfigration *configration = [BRTextConfigration new];
                configration.tapOutsideDismiss = NO;
                
                configration.buttonHorizontalMargin = 30;
                configration.buttonHeight = 35;
                configration.btnOneBackgroundColor = [UIColor orangeColor];
                configration.btnOneTitleColor = [UIColor purpleColor];
                
                return configration;
            } actionBlock:^(int index) {
                
            }];
            break;
        }
            
        default:
            break;
    }
}

@end
