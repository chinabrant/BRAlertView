//
//  BRTextAlertView.m
//  BRAlertView
//
//  Created by sjwu on 2016/10/11.
//  Copyright © 2016年 brant. All rights reserved.
//

#import "BRTextAlertView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BRTextAlertView ()

@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

@property (nonatomic, copy) NSString *message;


@end

@implementation BRTextAlertView

- (instancetype)initWithAttachView:(UIView *)view {
    self = [super initWithAttachView:view];
    if (self) {
        [self.centerView addSubview:self.contentLabel];
    }
    
    return self;
}

+ (BRTextAlertView *)showInView:(UIView *)view message:(NSString *)message buttonTitles:(NSArray *)buttonTitles configrationBlock:(BRTextConfigrationBlock _Nullable)configrationBlock actionBlock:(BRAlertViewActionBlock)actionBlock {
    NSAssert(buttonTitles.count <= 3, @"button count can't more than three");
    
    BRTextAlertView *alertView = [[BRTextAlertView alloc] initWithAttachView:view];
    alertView.message = message;
    alertView.buttonTitles = buttonTitles;
    alertView.actionBlock = actionBlock;
    
    if (configrationBlock) {
        [alertView configViews:configrationBlock()];
    }
    else {
        [alertView configViews:[BRTextConfigration new]];
    }
    
    
    [alertView show];
    
    return alertView;
}

+ (BRTextAlertView *)showInView:(UIView *)view message:(NSString *)message buttonTitles:(NSArray *)buttonTitles actionBlock:(BRAlertViewActionBlock)actionBlock {
    return [BRTextAlertView showInView:view message:message buttonTitles:buttonTitles configrationBlock:^BRTextConfigration * {
        return [BRTextConfigration new];
    } actionBlock:actionBlock];
}


// adjust view
- (void)configViews:(BRTextConfigration *)configration {
    
    self.contentLabel.textColor = configration.contentColor;
    self.contentLabel.font = configration.contentFont;
    
    CGFloat y = configration.contentTopPadding;
    
    CGFloat hei = 0;
    if (configration.attributedString) {
        // attributed string
        self.contentLabel.attributedText = configration.attributedString;
        hei = [self.contentLabel textRectForBounds:CGRectMake(0, 0, self.contentView.frame.size.width - 2 * configration.contentHorizontalPadding, CGFLOAT_MAX) limitedToNumberOfLines:0].size.height;
    }
    else {
        // normal string
        hei = [self.message boundingRectWithSize:CGSizeMake(self.contentView.frame.size.width - 2 * configration.contentHorizontalPadding, CGFLOAT_MAX)
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{ NSFontAttributeName : configration.contentFont }
                                         context:nil].size.height;
        self.contentLabel.text = self.message;
    }
    
    if (configration.haveTitle) {
        // have title
        y = configration.contentTopPadding + configration.titleFont.lineHeight + configration.titleLineGap + configration.contentTopPadding;
    }
    
    self.centerView.frame = CGRectMake(configration.contentHorizontalPadding,
                                       y,
                                       self.frame.size.width - 2 * configration.contentHorizontalPadding - 2 * configration.contentHorizontalMargin,
                                       hei);
    
    self.contentLabel.frame = CGRectMake(0, 0, self.centerView.frame.size.width, hei);
    
    [super configrationViews:configration];
}

# pragma mark - getters/setters

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.numberOfLines = 0;
    }
    
    return _contentLabel;
}

@end




@implementation BRTextConfigration

- (instancetype)init {
    self = [super init];
    if (self) {
        // default value
        _contentColor = [UIColor colorWithRed:0x22/255.0 green:0x22/255.0 blue:0x22/255.0 alpha:1];
        _contentFont = [UIFont systemFontOfSize:12];
        _attributedString = nil;
    }
    
    return self;
}

@end


NS_ASSUME_NONNULL_END
