//
//  BRAlertBaseView.h
//  BRAlertView
//
//  Created by sjwu on 2016/10/10.
//  Copyright © 2016年 brant. All rights reserved.
//

#import <UIKit/UIKit.h>

// button style
typedef NS_ENUM(NSInteger, BRButtonStyle) {
    BRButtonStyleNormal = 0,
    BRButtonStyleFull = 1,
};

// button count, no use
typedef NS_ENUM(NSInteger, BRButtonCount) {
    BRButtonCountNone = 0,    // no button
    BRButtonCountOne = 1,     // one button
    BRButtonCountTwo = 2,     // two button
    BRButtonCountThree = 3,   // three button
};

typedef void(^BRAlertViewActionBlock)(int index);

/**
 *
 */
@interface BRConfigration : NSObject

@property (nonatomic, strong) UIColor *backgroundColor;     // the mask color

@property (nonatomic) BOOL tapOutsideDismiss;               // default is YES

@property (nonatomic, copy) NSString *title;                // title string, default is nil
@property (nonatomic, strong) UIColor *titleLineColor;
@property (nonatomic) CGFloat titleLineGap;                 // default is 5

@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic) CGFloat contentTopOffset;             // contentView top offset，default is 0, contentView align vertical center
@property (nonatomic) CGFloat contentHorizontalMargin;      // content view horizontal margin
@property (nonatomic) CGFloat contentHorizontalPadding;     // content view horizontal padding
@property (nonatomic) CGFloat contentTopPadding;            // content view vertical padding
@property (nonatomic) CGFloat contentBottomPadding;         // 

@property (nonatomic) BOOL haveTitle;                       // title or not

@property (nonatomic) CGFloat buttonGap;                    // the gap between buttons
@property (nonatomic) CGFloat buttonTopMargin;                 //
@property (nonatomic) CGFloat buttonHorizontalMargin;

// 按钮
@property (nonatomic, strong) UIColor *btnOneTitleColor;
@property (nonatomic, strong) UIFont  *btnOneFont;

@property (nonatomic, strong) UIColor *btnTwoTitleColor;
@property (nonatomic, strong) UIFont  *btnTwoFont;

@property (nonatomic, strong) UIColor *btnThreeTitleColor;
@property (nonatomic, strong) UIFont  *btnThreeFont;

@property (nonatomic) CGFloat buttonHeight;                 // button height, default is 35

@property (nonatomic) CGFloat bottomHeight;             // default is 45
@property (nonatomic, strong) UIColor *bottomLineColor; // default is 0xe0e0e0

@end


/**
 * 
 */
@interface BRAlertBaseView : UIView

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *centerView;



@property (nonatomic, copy) NSArray *buttonTitles;

@property (nonatomic, copy) BRAlertViewActionBlock actionBlock;

- (instancetype)initWithAttachView:(UIView *)view;

- (void)configrationViews:(BRConfigration *)configration;

- (void)show;
- (void)dismiss;

@end
