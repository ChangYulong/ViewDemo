//
//  PasswordInputWindow.h
//  ViewDemo
//
//  Created by shanghaikedu on 16/5/13.
//  Copyright © 2016年 Langmuir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PasswordInputWindow : UIWindow

+ (PasswordInputWindow *)sharedInstance;

- (void)show;

@end
