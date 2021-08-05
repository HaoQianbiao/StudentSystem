//
//  ChangeMessageViewController.h
//  StudentCommandSystem
//
//  Created by haoqianbiao on 2021/8/2.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@protocol ChangeMessageViewControllerDelegate <NSObject>

-(void) receiveStudent: (Student*)student;

@end

@interface ChangeMessageViewController : UIViewController
<UITextFieldDelegate>
@property (nonatomic, strong) Student* student;
@property (nonatomic, strong) UIButton* buttonAll;
@property (nonatomic, strong) UITextField* nameTextField;
@property (nonatomic, strong) UITextField* scoreTextField;
@property (nonatomic, strong) UITextField* classTextField;
@property (nonatomic, strong) UIImageView* lineImageView;
@property (nonatomic, strong) UIButton* finishButton;
@property (nonatomic, assign) id <ChangeMessageViewControllerDelegate> delegate;

@end


