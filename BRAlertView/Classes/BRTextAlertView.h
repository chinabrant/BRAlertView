//
//  BRTextAlertView.h
//  BRAlertView
//
//  Created by sjwu on 2016/10/11.
//  Copyright © 2016年 brant. All rights reserved.
//

#import "BRAlertBaseView.h"
@class BRTextConfigration;

NS_ASSUME_NONNULL_BEGIN

typedef BRTextConfigration * (^BRTextConfigrationBlock)();

@interface BRTextConfigration : BRConfigration

@property (nonatomic, strong) UIColor *contentColor;
@property (nonatomic, strong) UIFont *contentFont;

@property (nonatomic, strong) NSAttributedString *attributedString; // if set this, message will invalid

@end

@interface BRTextAlertView : BRAlertBaseView

+ (BRTextAlertView *)showInView:(UIView *)view message:(NSString *)message buttonTitles:(NSArray *)buttonTitles actionBlock:(BRAlertViewActionBlock)actionBlock;

+ (BRTextAlertView *)showInView:(UIView *)view message:(NSString *)message buttonTitles:(NSArray *)buttonTitles configrationBlock:(BRTextConfigrationBlock _Nullable)config actionBlock:(BRAlertViewActionBlock)actionBlock;

@end

NS_ASSUME_NONNULL_END
