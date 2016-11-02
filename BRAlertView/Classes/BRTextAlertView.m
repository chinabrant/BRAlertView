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

- (instancetype)init {
    self = [super init];
    if (self) {
        [self.centerView addSubview:self.contentLabel];
    }
    
    return self;
}

+ (BRTextAlertView *)showMessage:(NSString *)message buttonTitles:(NSArray * _Nullable)buttonTitles configrationBlock:(_Nullable BRTextConfigrationBlock)configrationBlock actionBlock:(_Nullable BRAlertViewActionBlock)actionBlock {
    NSAssert(buttonTitles.count <= 3, @"button count can't more than three");
    
    BRTextAlertView *alertView = [[BRTextAlertView alloc] init];
    alertView.message = message;
    alertView.buttonTitles = buttonTitles;
//    alertView.contentLabel.text = message;
    alertView.actionBlock = actionBlock;
    
    if (configrationBlock) {
        
        BRTextConfigration *configration = configrationBlock() ? configrationBlock() : [BRTextConfigration new];
        
        [alertView configViews:configration];
    }
    else {
        
        [alertView configViews:[BRTextConfigration new]];
    }
    
    [alertView show];
    
    return alertView;
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
                                       self.contentView.frame.size.width - 2 * configration.contentHorizontalPadding,
                                       hei);
    
    self.contentLabel.frame = CGRectMake(0, 0, self.contentView.frame.size.width - 2 * configration.contentHorizontalPadding, hei);
    
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

//+ (instancetype)defaultTextConfigration {
//    static BRTextConfigration *configration = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        configration = [[BRTextConfigration alloc] initDefault];
//    });
//    
//    return configration;
//}

- (instancetype)init {
    self = [super init];
    if (self) {
        // default value
        _contentColor = [UIColor blackColor];
        _contentFont = [UIFont systemFontOfSize:16];
        _attributedString = nil;
    }
    
    return self;
}

@end


NS_ASSUME_NONNULL_END
