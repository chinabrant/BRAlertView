//
//  BRImageTextAlertView.m
//  TestIcon
//
//  Created by brant on 2017/2/27.
//  Copyright © 2017年 lhtc. All rights reserved.
//

#import "BRImageTextAlertView.h"

@interface BRImageTextAlertView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;

@property (nonatomic, copy) NSString *message;

@end

@implementation BRImageTextAlertView

- (instancetype)initWithAttachView:(UIView *)view {
    self = [super initWithAttachView:view];
    if (self) {
        [self.centerView addSubview:self.imageView];
        [self.centerView addSubview:self.label];
    }
    
    return self;
}

+ (BRImageTextAlertView *)showInView:(UIView *)view message:(NSString *)message image:(UIImage *)image actionBlock:(BRAlertViewActionBlock)actionBlock {
    BRImageTextAlertView *alertView = [[BRImageTextAlertView alloc] initWithAttachView:view];
    alertView.buttonTitles = @[@"取消", @"立即查看"];
    BRConfigration *config = [BRConfigration new];
    config.contentBottomPadding = 15;
    config.contentHorizontalPadding = 15;
    config.contentTopPadding = 20;
    alertView.label.text = message;
    alertView.imageView.image = image;
    
    [alertView configrationViews:config];
    
    [alertView show];
    
    return alertView;
}

- (void)configrationViews:(BRConfigration *)configration {
    CGFloat centerWidth = self.frame.size.width - 2 * configration.contentHorizontalPadding - 2 * configration.contentHorizontalMargin;
    
    self.imageView.frame = CGRectMake(0, 0, 60, 60);
    
    self.label.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame) + 5, 0, centerWidth - self.imageView.frame.size.width - 5, 60);
    
    self.centerView.frame = CGRectMake(configration.contentHorizontalPadding,
                                       configration.contentTopPadding,
                                       centerWidth,
                                       CGRectGetMaxY(self.imageView.frame));
    
    [super configrationViews:configration];
}

#pragma mark - setters/getters

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    
    return _imageView;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:15];
        _label.textColor = [UIColor colorWithRed:0x22/255.0 green:0x22/255.0 blue:0x22/255.0 alpha:1];
        _label.numberOfLines = 0;
    }
    
    return _label;
}

@end
