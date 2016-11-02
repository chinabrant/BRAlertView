//
//  BRCloseView.m
//  BRAlertView
//
//  Created by sjwu on 2016/10/11.
//  Copyright © 2016年 brant. All rights reserved.
//

#import "BRCloseView.h"

@implementation BRCloseView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    [[UIColor redColor] set];
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    // set line width
    CGContextSetLineWidth(currentContext, 5.0);
    
    CGContextMoveToPoint(currentContext, 8, 8);
    CGContextAddLineToPoint(currentContext, 22, 22);
    CGContextAddLineToPoint(currentContext, 15, 15);
    CGContextAddLineToPoint(currentContext, 22, 8);
    CGContextAddLineToPoint(currentContext, 8, 22);
    CGContextStrokePath(currentContext);
}


@end
