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

typedef BRTextConfigration * _Nullable  (^BRTextConfigrationBlock)();

@interface BRTextConfigration : BRConfigration

@property (nonatomic, strong) UIColor *contentColor;
@property (nonatomic, strong) UIFont *contentFont;

@property (nonatomic, strong) NSAttributedString *attributedString; // if set this, message will invalid

@end

@interface BRTextAlertView : BRAlertBaseView

+ (BRTextAlertView *)showMessage:(NSString *)message buttonTitles:(NSArray * _Nullable)buttonTitles configrationBlock:(_Nullable BRTextConfigrationBlock)configrationBlock actionBlock:(_Nullable BRAlertViewActionBlock)actionBlock;

@end

NS_ASSUME_NONNULL_END
