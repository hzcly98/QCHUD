//
//  ViewController.m
//  IndicatorViewTest
//
//  Created by 黄章成 on 2017/7/31.
//  Copyright © 2017年 黄章成. All rights reserved.
//

#import "ViewController.h"
#import "DGActivityIndicatorView.h"
#import "QCHUD.h"

@interface ViewController ()
@property (nonatomic, strong) DGActivityIndicatorView *activityIndicatorView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    _activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeCookieTerminator tintColor:[UIColor redColor] size:40.0f];
//    _activityIndicatorView.frame = CGRectMake((self.view.bounds.size.width - 50) * 0.5, (self.view.bounds.size.height - 50) * 0.5, 50.0f, 50.0f);
////    _activityIndicatorView.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:_activityIndicatorView];
//    [_activityIndicatorView startAnimating];
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [_activityIndicatorView stopAnimating];
//    });
    
    
    [QCHUD show];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [QCHUD dismiss];
    });
    
}


@end
