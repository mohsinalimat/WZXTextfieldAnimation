//
//  LoginView.m
//  LoginView
//
//  Created by wordoor－z on 15/12/21.
//  Copyright © 2015年 wzx. All rights reserved.
//

#import "LoginView.h"
#define WColor [UIColor colorWithRed:125/255.0 green:197/255.0 blue:255/255.0 alpha:1]
#define PColor [UIColor colorWithRed:199/255.0 green:199/255.0 blue:205/255.0 alpha:1]
@implementation LoginView
{
    UILabel * _placeLabel;
    UIView * _groundView;
    UITextField * _textfield;
    NSString * _title;
}
-(instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title
{
    if (self == [super initWithFrame:frame])
    {
        _title = title;
        _groundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _groundView.layer.cornerRadius = frame.size.height/2.0;
        _groundView.layer.borderColor = [UIColor grayColor].CGColor;
        _groundView.layer.borderWidth = 2;
        [self addSubview:_groundView];
        [self createTextfield:title];
    }
    return self;
}
-(void)createTextfield:(NSString *)title
{
    _textfield = [[UITextField alloc]initWithFrame:CGRectMake(self.frame.size.height/2.0,0, self.frame.size.width - self.frame.size.height, self.frame.size.height)];
    _textfield.delegate = self;
    _textfield.placeholder = [NSString stringWithFormat:@" %@ ",title];
    _textfield.font = [UIFont boldSystemFontOfSize:20];
    _textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    _textfield.tintColor = WColor;
    _textfield.textColor = [UIColor grayColor];
    [self addSubview:_textfield];
    _placeLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.height/2.0, 0, [self returnWidthWithTitle:[NSString stringWithFormat:@" %@ ",title] andHeight:20], 20)];
    _placeLabel.text = [NSString stringWithFormat:@" %@ ",title];
    _placeLabel.backgroundColor = [UIColor whiteColor];
    _placeLabel.textColor = PColor;
    _placeLabel.font = [UIFont boldSystemFontOfSize:20];
    _placeLabel.hidden = YES;
    [self addSubview:_placeLabel];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.placeholder = @"";
    _placeLabel.hidden = NO;
    CGRect rect = _placeLabel.frame;
    rect.origin.y = -_placeLabel.frame.size.height/2.0;
   
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
          _placeLabel.frame = rect;
    } completion:^(BOOL finished) {
        _placeLabel.textColor = WColor;
        _groundView.layer.borderColor = WColor.CGColor;
    }];
    
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    return YES;
}
-(void)hide
{
    if (_textfield.text.length>0)
    {
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            _placeLabel.textColor = PColor;
            _groundView.layer.borderColor = [UIColor grayColor].CGColor;
        } completion:^(BOOL finished) {
            _placeLabel.hidden = YES;
            [_textfield resignFirstResponder];
        }];
    }
    else
    {
        CGRect rect = _placeLabel.frame;
        rect.origin.y = self.frame.size.height/2.0;
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            _placeLabel.frame = rect;
            _placeLabel.textColor = PColor;
            _groundView.layer.borderColor = [UIColor grayColor].CGColor;
        } completion:^(BOOL finished) {
            _placeLabel.hidden = YES;
            _textfield.placeholder =[NSString stringWithFormat:@" %@ ",_title];
            [_textfield resignFirstResponder];
        }];
    }
}
-(CGFloat)returnWidthWithTitle:(NSString *)str andHeight:(CGFloat)height
{
   return [str boundingRectWithSize:
     CGSizeMake(CGFLOAT_MAX, height)
                             options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                         attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:20],NSFontAttributeName, nil] context:nil].size.width;
}
@end
