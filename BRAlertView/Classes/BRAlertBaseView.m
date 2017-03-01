//
//  BRAlertBaseView.m
//  BRAlertView
//
//  Created by sjwu on 2016/10/10.
//  Copyright © 2016年 brant. All rights reserved.
//

#import "BRAlertBaseView.h"
#import "BRCloseView.h"

@implementation BRConfigration

- (instancetype)init {
    self = [super init];
    if (self) {
        _backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        
        _titleColor = [UIColor blackColor];
        _titleFont = [UIFont systemFontOfSize:15];
        _titleLineGap = 5;
        
        // default 0xe2e2e2
        _titleLineColor = [UIColor colorWithRed:0xe2/255.0 green:0xe2/255.0 blue:0xe2/255.0 alpha:1];
        
        _tapOutsideDismiss = YES;
        
        // default value
        _contentHorizontalMargin = 59;
        _contentHorizontalPadding = 15;
        _contentTopPadding = 15;
        _contentBottomPadding = 15;
        _contentTopOffset = 0;
        _title = nil;
        
        _buttonGap = 10;
        _buttonTopMargin = 20;
        _buttonHorizontalMargin = 0;
        
        _btnOneTitleColor = [UIColor colorWithRed:0x22/255.0 green:0x22/255.0 blue:0x22/255.0 alpha:1];
        _btnOneFont = [UIFont systemFontOfSize:12];
        
        _btnTwoFont = [UIFont systemFontOfSize:12];
        _btnTwoTitleColor = [UIColor colorWithRed:0x1e/255.0 green:0xea/255.0 blue:0x70/255.0 alpha:1];
        
        
        _btnThreeTitleColor = [UIColor blackColor];
        _btnThreeFont = [UIFont systemFontOfSize:12];
        
        _buttonHeight = 41;
        
        _bottomHeight = 40;
        _bottomLineColor = [UIColor colorWithRed:0xe0/255.0 green:0xe0/255.0 blue:0xe0/255.0 alpha:1];
    }
    
    return self;
}

@end

@interface BRAlertBaseView ()

@property (nonatomic, strong) BRConfigration *configration;

@property (nonatomic, strong) BRCloseView *closeView;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *line;

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) UIView *bottomLine;

@property (nonatomic, strong) UIView *attachView;

@end

@implementation BRAlertBaseView

- (instancetype)init {
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        
        
        [self addSubview:self.contentView];
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        self.contentView.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0, self.frame.size.height / 2.0);
        
        [self.contentView addSubview:self.titleLabel];
        
        [self.contentView addSubview:self.centerView];
        
        [self.contentView addSubview:self.line];
        
        [self.contentView addSubview:self.bottomView];
        [self.bottomView addSubview:self.bottomLine];
    }
    
    return self;
}

- (instancetype)initWithAttachView:(UIView *)view {
    self = [super initWithFrame:view.bounds];
    if (self) {
        _attachView = view;
        
        [self addSubview:self.contentView];
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        self.contentView.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0, self.frame.size.height / 2.0);
        
        [self.contentView addSubview:self.titleLabel];
        
        [self.contentView addSubview:self.centerView];
        
        [self.contentView addSubview:self.line];
        
        [self.contentView addSubview:self.bottomView];
        [self.bottomView addSubview:self.bottomLine];
    }
    
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!self.configration.tapOutsideDismiss) {
        return;
    }
    
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self.contentView];
    if (p.x < 0 || p.y < 0 || p.x > self.contentView.frame.size.width || p.y > self.contentView.frame.size.height) {
        [self dismiss];
    }
}

- (void)configrationViews:(BRConfigration *)configration {
    _configration = configration;
    
    self.bottomView.frame = CGRectMake(0, CGRectGetMaxY(self.centerView.frame) + configration.contentBottomPadding, self.frame.size.width - 2 * configration.contentHorizontalMargin, self.configration.bottomHeight);
    self.bottomLine.frame = CGRectMake(0, 0, self.bottomView.frame.size.width, 0.5);
    
    self.backgroundColor = configration.backgroundColor;
    
    if (configration.haveTitle) {
        // have title
        self.line.hidden = NO;
        self.line.backgroundColor = configration.titleLineColor;
        
        self.titleLabel.hidden = NO;
        self.titleLabel.text = configration.title;
        
        self.titleLabel.textColor = configration.titleColor;
        self.titleLabel.font = configration.titleFont;
        
        self.titleLabel.frame = CGRectMake(configration.contentHorizontalPadding, configration.contentTopPadding, self.frame.size.width - 2 * configration.contentHorizontalMargin - 2 * configration.contentHorizontalPadding, configration.titleFont.lineHeight);
        self.line.frame = CGRectMake(self.titleLabel.frame.origin.x, CGRectGetMaxY(self.titleLabel.frame) + configration.titleLineGap, self.titleLabel.frame.size.width, 0.5);
    }
    else {
        self.titleLabel.hidden = YES;
        self.line.hidden = YES;
    }
    
    if (self.buttonTitles.count > 0) {
        // button height
        CGFloat buttonWidth = self.bottomView.frame.size.width / self.buttonTitles.count;
        self.bottomView.hidden = NO;
        
        for (int i = 0; i < self.buttonTitles.count; i++) {
            
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * buttonWidth, 0.5, buttonWidth, configration.bottomHeight - 0.5)];
            [button setTitle:self.buttonTitles[i] forState:UIControlStateNormal];
            button.tag = i;
            [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [self.bottomView addSubview:button];
            
            [self configButton:button index:i];
        }
        
        if (self.buttonTitles.count > 1) {
            if (self.buttonTitles.count == 2) {
                UIView *line = [[UIView alloc] initWithFrame:CGRectMake(buttonWidth, 15, 0.5, self.configration.bottomHeight - 30)];
                line.backgroundColor = self.configration.bottomLineColor;
                [self.bottomView addSubview:line];
            } else if (self.buttonTitles.count == 3) {
                UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(buttonWidth, 15, 0.5, self.configration.bottomHeight - 30)];
                line1.backgroundColor = self.configration.bottomLineColor;
                [self.bottomView addSubview:line1];
                
                UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(2 * buttonWidth, 15, 0.5, self.configration.bottomHeight - 30)];
                line2.backgroundColor = self.configration.bottomLineColor;
                [self.bottomView addSubview:line2];
            }
        }
    }
    else {
        self.bottomView.hidden = YES;
    }
    
    CGFloat hei = CGRectGetMaxY(self.centerView.frame) + configration.contentBottomPadding;
    if (self.buttonTitles.count > 0) {
        hei += configration.buttonHeight;
    }
    
    self.contentView.frame = CGRectMake(configration.contentHorizontalMargin, 0, self.frame.size.width - 2 * configration.contentHorizontalMargin, hei);
    self.closeView.frame = CGRectMake(self.contentView.frame.size.width - 30, 0, 30, 30);
}

- (void)buttonPressed:(UIButton *)button {
    [self dismiss];
    
    if (self.actionBlock) {
        self.actionBlock((int) button.tag);
    }
}

- (void)configButton:(UIButton *)button index:(int)index {
    
    if (index == 0) {
        [button setTitleColor:self.configration.btnOneTitleColor forState:UIControlStateNormal];
        button.titleLabel.font = self.configration.btnOneFont;
    }
    else if (index == 1) {
        [button setTitleColor:self.configration.btnTwoTitleColor forState:UIControlStateNormal];
        button.titleLabel.font = self.configration.btnTwoFont;
    }
    else if (index == 2) {
        [button setTitleColor:self.configration.btnThreeTitleColor forState:UIControlStateNormal];
        button.titleLabel.font = self.configration.btnThreeFont;
    }
}

# pragma mark - getters / setters

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.5)];
        _line.backgroundColor = [UIColor lightGrayColor];
    }
    
    return _line;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(30, 50, self.frame.size.width - 30 * 2, 80)];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.layer.cornerRadius = 8.0f;
        _contentView.layer.masksToBounds = YES;
    }
    
    return _contentView;
}

- (BRCloseView *)closeView {
    if (!_closeView) {
        _closeView = [[BRCloseView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _closeView.layer.cornerRadius = 8.0f;
        _closeView.layer.masksToBounds = YES;
        _closeView.layer.borderColor = [UIColor redColor].CGColor;
        _closeView.layer.borderWidth = 0.5f;
    }
    
    return _closeView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _titleLabel;
}

- (UIView *)centerView {
    if (!_centerView) {
        _centerView = [UIView new];
    }
    
    return _centerView;
}

- (UIView *)bottomLine {
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 0.5)];
        _bottomLine.backgroundColor = [UIColor colorWithRed:0xe0/255.0 green:0xe0/255.0 blue:0xe0/255.0 alpha:1];
    }
    
    return _bottomLine;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
    }
    
    return _bottomView;
}

# pragma mark - show / dismiss

- (void)showAnimation {
    self.contentView.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0, -self.contentView.frame.size.height);
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.8
                          delay:0.0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.6
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
        weakSelf.contentView.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0, weakSelf.frame.size.height / 2.0 - weakSelf.configration.contentTopOffset);
    }
                     completion:^(BOOL finished) {
        
    }];
}

- (void)show {
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    [window addSubview:self];
//
    [self.attachView addSubview:self];
    
    [self showAnimation];
}

- (void)showInView:(UIView *)view {
    
}

- (void)dismiss {
    __weak typeof(self) weakSelf = self;
    
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.contentView.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0, weakSelf.frame.size.height + weakSelf.contentView.frame.size.height / 2.0);
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
    
}

@end
