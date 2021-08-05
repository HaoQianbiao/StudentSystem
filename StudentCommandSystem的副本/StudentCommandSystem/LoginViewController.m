//
//  LoginViewController.m
//  StudentCommandSystem
//
//  Created by haoqianbiao on 2021/8/1.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "MainViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    _buttonAll = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,  self.view.bounds.size.height)];
    [_buttonAll addTarget:self action:@selector(textFieldDidEndEditing:) forControlEvents:UIControlEventTouchUpInside];
    _buttonAll.adjustsImageWhenHighlighted = NO;
    UIImage* image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/StudentCommandSystem/WechatIMG51.jpeg"];
    [_buttonAll setImage:image forState:UIControlStateNormal];
    [self.view addSubview:_buttonAll];
    
    _nameTextField = [[UITextField alloc] init];
    _nameTextField.frame = CGRectMake(50, 370, 300, 60);
    _nameTextField.font = [UIFont systemFontOfSize:25];
    _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    _nameTextField.delegate = self;
    [_nameTextField setBackgroundColor:[UIColor clearColor]];
    UIImageView* userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 35, 35)];
    userImageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/StudentCommandSystem/zhanghao.png"];
    _lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 10, 3, 40)];
    _lineImageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/StudentCommandSystem/line.png"];
    [_nameTextField setValue:[NSNumber numberWithInt:55] forKey:@"paddingLeft"];
    [_nameTextField addSubview:userImageView];
    [_nameTextField addSubview:_lineImageView];
    [_buttonAll addSubview:_nameTextField];
    _passwordTextField = [[UITextField alloc] init];
    _passwordTextField.frame = CGRectMake(50, 450, 300, 60);
    _passwordTextField.font = [UIFont systemFontOfSize:25];
    _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.delegate = self;
    userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 35, 35)];
    userImageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/StudentCommandSystem/ziyuan.png"];
    _lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 10, 3, 40)];
    _lineImageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/StudentCommandSystem/line.png"];
    [_passwordTextField setValue:[NSNumber numberWithInt:55] forKey:@"paddingLeft"];
    [_passwordTextField addSubview:userImageView];
    [_passwordTextField addSubview:_lineImageView];
    [_passwordTextField setBackgroundColor:[UIColor clearColor]];
    [_buttonAll addSubview:_passwordTextField];
    
    _loginButton = [[UIButton alloc]initWithFrame:CGRectMake(70, 540, 110, 50)];
    [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    _loginButton.titleLabel.font = [UIFont systemFontOfSize:30];
    _loginButton.titleLabel.tintColor = [UIColor whiteColor];
    _loginButton.layer.borderWidth = 1;
    [_loginButton.layer setMasksToBounds:YES];
    [_loginButton.layer setCornerRadius:5];
    [_loginButton addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];
    [_buttonAll addSubview:_loginButton];
    
    _registerButton = [[UIButton alloc] initWithFrame:CGRectMake(220, 540, 110, 50)];
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
    _registerButton.titleLabel.font = [UIFont systemFontOfSize:30];
    _registerButton.titleLabel.tintColor = [UIColor whiteColor];
    _registerButton.layer.borderWidth = 1;
    [_registerButton.layer setMasksToBounds:YES];
    [_registerButton.layer setCornerRadius:5];
    [_registerButton addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    [_buttonAll addSubview:_registerButton];
}

-(void) pushNameText:(NSString *)nameText {
    _strName = nameText;
}
-(void) pushPasswordText:(NSString *)passwordText {
    _strPassword = passwordText;
}
-(void) pressLogin {
    
    if ((([_strName isEqualToString:_nameTextField.text] && [_strPassword isEqualToString:_passwordTextField.text]) && (_nameTextField.text != nil) && (_passwordTextField.text != nil)) | ([_nameTextField.text isEqualToString:@"111"] && [_passwordTextField.text isEqualToString:@"111"])) {
        MainViewController* main = [[MainViewController alloc] init];
        [self presentViewController:main animated:YES completion:nil];
    } else {
        _alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"账号或密码错误或不存在，请重新输入或注册！！！" preferredStyle:UIAlertControllerStyleAlert];
        [_alertView addAction:[UIAlertAction actionWithTitle:@"sure" style:UIActionSheetStyleDefault handler:nil]];
        [self presentViewController:_alertView animated:true completion:nil];
    }
}

-(void) pressRegister {
    RegisterViewController* registerViewController = [[RegisterViewController alloc] init];
    registerViewController.delegate = self;
    [self presentViewController:registerViewController animated:YES completion:nil];
}

-(void) textFieldDidBeginEditing:(UITextField *)textField
{
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@ "ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    //将视图的Y坐标向上移动，以使下面腾出地方用于软键盘的显示
    self.buttonAll.frame = CGRectMake(0, -100, self.buttonAll.frame.size.width, self.buttonAll.frame.size.height);
    [UIView commitAnimations];
}
//取消第一响应，也就是输入完毕，屏幕恢复原状
-( void )textFieldDidEndEditing:(UITextField *)textField
{
    //滑动效果
    [_passwordTextField resignFirstResponder];
    [_nameTextField resignFirstResponder];
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@ "ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    //恢复屏幕
    self.buttonAll.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
    
}
@end
