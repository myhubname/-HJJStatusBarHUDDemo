//
//  HJJStatusBar.m
//  HJJStatuBarHUD
//
//  Created by 胡俊杰 on 16/7/14.
//  Copyright © 2016年 胡俊杰. All rights reserved.
//

#import "HJJStatusBar.h"

//消息动画时间
static CGFloat const HJJAnmationDuration=0.25;
//消息停留和暂停时间
static CGFloat const HJJMessageDuration=2.0;

#define HJJFontSize [UIFont systemFontOfSize:12]

@implementation HJJStatusBar
//创建窗口
static UIWindow *window_;

//创建时间轴
static NSTimer *timer_;

//显示窗口
+(void)showWindow
{
 //初始化窗口
    window_=[[UIWindow alloc] init];
    
    //设置窗口的frame
    CGFloat windowH=20;
    CGRect frame=CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    //设置窗口
    window_.frame=frame;
    window_.backgroundColor=[UIColor blackColor];
    window_.windowLevel=UIWindowLevelAlert;
    window_.hidden=NO;
    frame.origin.y=0;
    
    [UIView animateWithDuration:HJJAnmationDuration animations:^{
        window_.frame=frame;
    }];
    
}

+(void)HJ_showMessage:(NSString *)message Image:(UIImage *)image{
    //取消时间
    [timer_ invalidate];

    //显示窗口
    [self showWindow];
    //设置button
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=window_.bounds;
    button.titleLabel.font=HJJFontSize;
    [button setTitle:message forState:UIControlStateNormal];
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
    }
    [window_ addSubview:button];
    
    timer_=[NSTimer scheduledTimerWithTimeInterval:HJJMessageDuration target:self selector:@selector(HJ_hiden) userInfo:nil repeats:NO];

    
    
}
//显示成功信息
+(void)HJ_showSucess:(NSString *)message{
    
    [self HJ_showMessage:message Image:[UIImage imageNamed:@"HJJStatusBarImage.bundle/check"]];
    
}
//显示错误信息
+(void)HJ_showError:(NSString *)message{
    [self HJ_showMessage:message Image:[UIImage imageNamed:@"HJJStatusBarImage.bundle/error"]];
}
//显示普通信息
+(void)HJ_showComment:(NSString *)message{
 
    [self HJ_showMessage:message Image:nil];
}
//显示加载信息
+(void)HJ_showLoading:(NSString *)message{
    //销毁时间
    [timer_ invalidate];
    timer_=nil;
    //显示窗口
    [self showWindow];
    //初始化label
    UILabel *label=[[UILabel alloc] init];
    label.frame=window_.bounds;
    label.font=HJJFontSize;
    label.text=message;
    label.textColor=[UIColor whiteColor];
    label.textAlignment=NSTextAlignmentCenter;
    [window_ addSubview:label];
    
    //创建小菊花
    UIActivityIndicatorView *indicatorview=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    //计算文字宽度
    CGFloat LabeltextW=[message sizeWithAttributes:@{NSFontAttributeName:HJJFontSize}].width;
    //计算X值
    CGFloat centerX=(window_.frame.size.width-LabeltextW)*0.5-20;
    //计算Y值
    CGFloat centerY=window_.frame.size.height*0.5;
    
    indicatorview.center=CGPointMake(centerX, centerY);
    
    [indicatorview startAnimating];
    
    [window_ addSubview:indicatorview];
}
//隐藏
+(void)HJ_hiden{
    
    [UIView animateWithDuration:HJJAnmationDuration animations:^{
        CGRect frame= window_.frame;
        frame.origin.y=-frame.size.height;
        window_.frame=frame;
    } completion:^(BOOL finished) {
        
        window_=nil;
        timer_=nil;

    }];
}

@end
