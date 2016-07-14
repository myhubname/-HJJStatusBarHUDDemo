//
//  ViewController.m
//  HJJStatuBarHUD
//
//  Created by 胡俊杰 on 16/7/14.
//  Copyright © 2016年 胡俊杰. All rights reserved.
//

#import "ViewController.h"
#import "HJJStatusBar.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Sucess:(id)sender {
    [HJJStatusBar HJ_showSucess:@"加载成功!"];
}
- (IBAction)Error:(id)sender {
    [HJJStatusBar HJ_showError:@"加载失败"];
}
- (IBAction)Comment:(id)sender {
    [HJJStatusBar HJ_showComment:@"普通事件"];
}
- (IBAction)Loading:(id)sender {
    
    [HJJStatusBar HJ_showLoading:@"正在加载..."];
}
- (IBAction)hiden:(id)sender {
    [HJJStatusBar HJ_hiden];
}

@end
