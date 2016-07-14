//
//  HJJStatusBar.h
//  HJJStatuBarHUD
//
//  Created by 胡俊杰 on 16/7/14.
//  Copyright © 2016年 胡俊杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJJStatusBar : NSObject
/**
 *  调用
 *
 *  @param message   文字
 *  @param image   图片
 */
+(void)HJ_showMessage:(NSString *)message Image:(UIImage *)image;
//显示成功信息
+(void)HJ_showSucess:(NSString *)message;
//显示错误信息
+(void)HJ_showError:(NSString *)message;
//显示普通信息
+(void)HJ_showComment:(NSString *)message;
//显示加载信息
+(void)HJ_showLoading:(NSString *)message;
//隐藏
+(void)HJ_hiden;

@end
