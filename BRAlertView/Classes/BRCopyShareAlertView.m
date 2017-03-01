//
//  BRCopyShareAlertView.m
//  TestIcon
//
//  Created by brant on 2017/2/27.
//  Copyright © 2017年 lhtc. All rights reserved.
//

#import "BRCopyShareAlertView.h"

@interface BRCopyShareAlertView ()

@property (nonatomic, strong) UIView *shareBackView;
@property (nonatomic, strong) UILabel *shareTitleLabel;
@property (nonatomic, strong) UILabel *shareLabel;

@property (nonatomic, copy) NSString *message;

@end

// wid 257
@implementation BRCopyShareAlertView

- (instancetype)initWithAttachView:(UIView *)view {
    self = [super initWithAttachView:view];
    if (self) {
        [self.centerView addSubview:self.shareBackView];
        [self.centerView addSubview:self.shareTitleLabel];
        [self.shareBackView addSubview:self.shareLabel];
    }
    
    return self;
}

+ (BRCopyShareAlertView *)showInView:(UIView *)view message:(NSString *)message actionBlock:(BRAlertViewActionBlock)actionBlock {
    BRCopyShareAlertView *alertView = [[BRCopyShareAlertView alloc] initWithAttachView:view];
    alertView.message = message;
    alertView.buttonTitles = @[@"不分享了", @"去粘贴"];
    BRConfigration *config = [BRConfigration new];
    config.contentBottomPadding = 17;
    [alertView configrationViews:config];
    
    [alertView show];
    
    return alertView;
}

- (void)configrationViews:(BRConfigration *)configration {
    CGFloat centerWidth = self.frame.size.width - 2 * configration.contentHorizontalPadding - 2 * configration.contentHorizontalMargin;
    
    CGFloat hei = [self.message boundingRectWithSize:CGSizeMake(centerWidth - 20, CGFLOAT_MAX)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:12] }
                                     context:nil].size.height;
    
    self.shareLabel.text = self.message;
    self.shareLabel.frame = CGRectMake(10, 16, centerWidth - 20, hei);
    
    self.shareBackView.frame = CGRectMake(0, 23, centerWidth, hei + 16 + 10);
    self.shareTitleLabel.frame = CGRectMake((self.shareBackView.frame.size.width - 150) / 2.0, self.shareBackView.frame.origin.y - 8, 150, 16);
    
    
    self.centerView.frame = CGRectMake(configration.contentHorizontalPadding,
                                       configration.contentTopPadding,
                                       centerWidth,
                                       CGRectGetMaxY(self.shareBackView.frame));
    
    [super configrationViews:configration];
}

#pragma mark - setters/getters

- (UIView *)shareBackView {
    if (!_shareBackView) {
        _shareBackView = [[UIView alloc] init];
        _shareBackView.layer.borderWidth = 0.5;
        _shareBackView.layer.borderColor = [UIColor colorWithRed:0xe0/255.0 green:0xe0/255.0 blue:0xe0/255.0 alpha:1].CGColor;
    }
    
    return _shareBackView;
}

- (UILabel *)shareTitleLabel {
    if (!_shareTitleLabel) {
        _shareTitleLabel = [[UILabel alloc] init];
        _shareTitleLabel.textColor = [UIColor colorWithRed:0x22/255.0 green:0x22/255.0 blue:0x22/255.0 alpha:1];
        _shareTitleLabel.font = [UIFont systemFontOfSize:15];
        _shareTitleLabel.text = @"您的分享链接已复制";
        _shareTitleLabel.backgroundColor = [UIColor whiteColor];
        _shareTitleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _shareTitleLabel;
}

- (UILabel *)shareLabel {
    if (!_shareLabel) {
        _shareLabel = [[UILabel alloc] init];
        _shareLabel.textColor = [UIColor colorWithRed:0x99/255.0 green:0x99/255.0 blue:0x99/255.0 alpha:1];
        _shareLabel.font = [UIFont systemFontOfSize:12];
        _shareLabel.numberOfLines = 0;
    }
    
    return _shareLabel;
}

@end
