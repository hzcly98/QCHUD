//
//  QCHUD.m
//  IndicatorViewTest
//
//  Created by 黄章成 on 2017/7/31.
//  Copyright © 2017年 黄章成. All rights reserved.
//

#import "QCHUD.h"
#import "DGActivityIndicatorView.h"

@interface QCHUD()
@property (nonatomic, strong) DGActivityIndicatorView *indicatorView;
@property (nonatomic, strong) UIView *bgView;
@end

@implementation QCHUD

+ (QCHUD*)sharedView {
    static dispatch_once_t once;
    
    static QCHUD *sharedView;
    dispatch_once(&once, ^{
        sharedView = [[self alloc] init];
        
    });
    return sharedView;
}

+ (void)show {
    [[[self sharedView] frontWindow] addSubview:[[self sharedView] makeBgView]];
    [[[self sharedView] makeIndicatorView] startAnimating];
}

+ (void)dismiss {
    [[[self sharedView] makeIndicatorView] stopAnimating];
    [[[self sharedView] makeBgView] removeFromSuperview];
}

- (DGActivityIndicatorView*)makeIndicatorView {
    if(!_indicatorView) {
        _indicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeCookieTerminator tintColor:[UIColor redColor] size:40.0f];
        CGRect mainFrame = [UIScreen mainScreen].bounds;
        _indicatorView.frame = CGRectMake((mainFrame.size.width - 50) * 0.5, (mainFrame.size.height - 50) * 0.5, 50.0f, 50.0f);
        [[self makeBgView] addSubview:_indicatorView];
    }
    return _indicatorView;
}

- (UIView *)makeBgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _bgView.backgroundColor = [UIColor clearColor];
    }
    return _bgView;
}

- (UIWindow *)frontWindow {
    NSEnumerator *frontToBackWindows = [UIApplication.sharedApplication.windows reverseObjectEnumerator];
    for (UIWindow *window in frontToBackWindows) {
        BOOL windowOnMainScreen = window.screen == UIScreen.mainScreen;
        BOOL windowIsVisible = !window.hidden && window.alpha > 0;
        BOOL windowLevelSupported = (window.windowLevel >= UIWindowLevelNormal);
        
        if(windowOnMainScreen && windowIsVisible && windowLevelSupported) {
            return window;
        }
    }
    return nil;
}

@end
