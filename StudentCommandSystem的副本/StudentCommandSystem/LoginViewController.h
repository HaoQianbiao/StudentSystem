//
//  LoginViewController.h
//  StudentCommandSystem
//
//  Created by haoqianbiao on 2021/8/1.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController <RegisterViewControllerDelegate>
@property (nonatomic, strong) UITextField* nameTextField;
@property (nonatomic, strong) UITextField* passwordTextField;
@property (nonatomic, strong) UIButton* loginButton;
@property (nonatomic, strong) UIButton* registerButton;
@property (nonatomic, strong) UIButton* buttonAll;
@property (nonatomic, strong) UIButton* automaticLogin;
@property (nonatomic, strong) UIImageView* lineImageView;
@property (nonatomic, weak) NSString* strName;
@property (nonatomic, weak) NSString* strPassword;
@property (retain, nonatomic) UIAlertController* alertView;
@end

NS_ASSUME_NONNULL_END
