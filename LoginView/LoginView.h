//
//  LoginView.h
//  LoginView
//
//  Created by wordoor－z on 15/12/21.
//  Copyright © 2015年 wzx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView<UITextFieldDelegate>
-(instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title;
-(void)hide;
@end
