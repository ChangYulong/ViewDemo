//
//  PasswordInputWindow.m
//  ViewDemo
//
//  Created by shanghaikedu on 16/5/13.
//  Copyright © 2016年 Langmuir. All rights reserved.
//

#import "PasswordInputWindow.h"

@implementation PasswordInputWindow{
    UITextField * _textField;
}

+ (PasswordInputWindow *)sharedInstance{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithFrame:[UIScreen mainScreen].bounds];
    });
    return sharedInstance;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.secureTextEntry = YES;
        [self addSubview:_textField];
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(100, 150, 100, 30);
        btn.titleLabel.textColor = [UIColor blackColor];
        [btn setTitle:@"确定" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(completeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

- (void)show{
    [self makeKeyWindow];
    self.hidden = NO;
}

- (void)completeButtonPressed:(id)sender{
    if ([_textField.text isEqualToString:@"abcd"]) {
        [_textField resignFirstResponder];
        [self resignKeyWindow];
        self.hidden = YES;
    }else{
        [self showErrorAlertView];
    }
}

- (void)showErrorAlertView{
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:nil message:@"密码错误，正确的密码是abcd" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

@end
