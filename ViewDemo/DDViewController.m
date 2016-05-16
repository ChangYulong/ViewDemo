//
//  DDViewController.m
//  ViewDemo
//
//  Created by shanghaikedu on 16/5/12.
//  Copyright © 2016年 Langmuir. All rights reserved.
//

#import "DDViewController.h"

@interface DDViewController ()
@property (nonatomic, strong) UIImageView * imageView;
@end

@implementation DDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"第二页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel * lab = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 100, 30)];
    lab.text = @"菲菲非";
    [self.view addSubview:lab];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 250, 100, 100)];
    [self.view addSubview:self.imageView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL * url = [NSURL URLWithString:@"http://ww2.sinaimg.cn/mw1024/75614297jw1f34e5llyz4j20qo0zj0zl.jpg"];
        NSData * data = [NSData dataWithContentsOfURL:url];
        UIImage * image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
