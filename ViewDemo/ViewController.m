//
//  ViewController.m
//  ViewDemo
//
//  Created by shanghaikedu on 16/5/12.
//  Copyright © 2016年 Langmuir. All rights reserved.
//

#import "ViewController.h"
#import "DDViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    UIWindow * _uiwindow;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"第一页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    //手动创建UIWindow
    UIButton * windowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    windowBtn.frame = CGRectMake(100, 300, 100, 30);
    windowBtn.backgroundColor = [UIColor greenColor];
    [windowBtn addTarget:self action:@selector(createWindowButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:windowBtn];
}

- (void)createWindowButtonPressed:(id)sender{
    _uiwindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _uiwindow.windowLevel = UIWindowLevelNormal;
    _uiwindow.backgroundColor = [UIColor redColor];
    _uiwindow.hidden = NO;
    
    UIGestureRecognizer * gesture = [[UIGestureRecognizer alloc] init];
    [gesture addTarget:self action:@selector(hideWindow:)];
    [_uiwindow addGestureRecognizer:gesture];
}

- (void)hideWindow:(UIGestureRecognizer *)gesture{
    _uiwindow.hidden = YES;
    _uiwindow = nil;
}

- (void)btnAction{
    DDViewController * dd = [[DDViewController alloc] init];
    [self.navigationController pushViewController:dd animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
