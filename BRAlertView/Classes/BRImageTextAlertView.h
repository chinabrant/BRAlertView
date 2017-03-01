//
//  BRImageTextAlertView.h
//  TestIcon
//
//  Created by brant on 2017/2/27.
//  Copyright © 2017年 lhtc. All rights reserved.
//

#import "BRAlertBaseView.h"

@interface BRImageTextAlertView : BRAlertBaseView

+ (BRImageTextAlertView *)showInView:(UIView *)view message:(NSString *)message image:(UIImage *)image actionBlock:(BRAlertViewActionBlock)actionBlock;

@end
