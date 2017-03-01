//
//  BRCopyShareAlertView.h
//  TestIcon
//
//  Created by brant on 2017/2/27.
//  Copyright © 2017年 lhtc. All rights reserved.
//

#import "BRAlertBaseView.h"

@interface BRCopyShareAlertView : BRAlertBaseView

+ (BRCopyShareAlertView *)showInView:(UIView *)view message:(NSString *)message actionBlock:(BRAlertViewActionBlock)actionBlock;

@end
