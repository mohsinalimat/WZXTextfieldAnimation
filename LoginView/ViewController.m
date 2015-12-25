//
//  ViewController.m
//  LoginView
//
//  Created by wordoor－z on 15/12/21.
//  Copyright © 2015年 wzx. All rights reserved.
//

#import "ViewController.h"
#import "LoginView.h"
@interface ViewController ()
{
    LoginView * view ;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    view = [[LoginView alloc]initWithFrame:CGRectMake(30, 300, self.view.frame.size.width - 60, 60) andTitle:@"Name"];
    [self.view addSubview:view];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [view hide];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
