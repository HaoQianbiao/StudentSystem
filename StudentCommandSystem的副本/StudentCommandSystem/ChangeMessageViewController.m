//
//  ChangeMessageViewController.m
//  StudentCommandSystem
//
//  Created by haoqianbiao on 2021/8/2.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "ChangeMessageViewController.h"

@interface ChangeMessageViewController ()

@end

@implementation ChangeMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _buttonAll = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,  self.view.bounds.size.height)];
    [_buttonAll addTarget:self action:@selector(textFieldDidEndEditing:) forControlEvents:UIControlEventTouchUpInside];
    _buttonAll.adjustsImageWhenHighlighted = NO;
    UIImage* image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/StudentCommandSystem/background.jpeg"];
    [_buttonAll setImage:image forState:UIControlStateNormal];
    [self.view addSubview:_buttonAll];
    
    UIButton* buttonExit = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonExit setTitle:@"BACK" forState:UIControlStateNormal];
    [buttonExit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonExit addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    buttonExit.titleLabel.font = [UIFont systemFontOfSize:25];
    buttonExit.frame = CGRectMake(250, 600, 70, 50);
    [_buttonAll addSubview:buttonExit];
    
    _finishButton = [[UIButton alloc]initWithFrame:CGRectMake(70, 600, 50, 50)];
    [_finishButton setTitle:@"OK" forState:UIControlStateNormal];
    _finishButton.titleLabel.font = [UIFont systemFontOfSize:30];
    _finishButton.titleLabel.tintColor = [UIColor whiteColor];
    _finishButton.layer.borderWidth = 1;
    [_finishButton.layer setMasksToBounds:YES];
    [_finishButton.layer setCornerRadius:5];
    [_finishButton addTarget:self action:@selector(finish) forControlEvents:UIControlEventTouchUpInside];
    [_buttonAll addSubview:_finishButton];
    
    _nameTextField = [[UITextField alloc] init];
    _nameTextField.frame = CGRectMake(50, 300, 250, 50);
    _nameTextField.font = [UIFont systemFontOfSize:25];
    _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    _nameTextField.delegate = self;
    _nameTextField.textColor = [UIColor whiteColor];
    _nameTextField.text = _student.name;
    [_nameTextField setBackgroundColor:[UIColor clearColor]];
    UIImageView* userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 3, 35, 35)];
    userImageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/StudentCommandSystem/iconfont-zhanghao.png"];
    _lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 3, 3, 40)];
    _lineImageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/StudentCommandSystem/line.png"];
    [_nameTextField setValue:[NSNumber numberWithInt:57] forKey:@"paddingLeft"];
    [_nameTextField addSubview:userImageView];
    [_nameTextField addSubview:_lineImageView];
    [_buttonAll addSubview:_nameTextField];
    _scoreTextField = [[UITextField alloc] init];
    _scoreTextField.frame = CGRectMake(50, 380, 250, 50);
    _scoreTextField.font = [UIFont systemFontOfSize:25];
    _scoreTextField.borderStyle = UITextBorderStyleRoundedRect;
    _scoreTextField.delegate = self;
    _scoreTextField.textColor = [UIColor whiteColor];
    userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 3, 35, 35)];
    userImageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/StudentCommandSystem/wdcj.png"];
    _lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 3, 3, 40)];
    _lineImageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/StudentCommandSystem/line.png"];
    [_scoreTextField setValue:[NSNumber numberWithInt:57] forKey:@"paddingLeft"];
    [_scoreTextField addSubview:userImageView];
    [_scoreTextField addSubview:_lineImageView];
    [_scoreTextField setBackgroundColor:[UIColor clearColor]];
    [_buttonAll addSubview:_scoreTextField];
    
    _classTextField = [[UITextField alloc] init];
    _classTextField.frame = CGRectMake(50, 460, 250, 50);
    _classTextField.font = [UIFont systemFontOfSize:25];
    _classTextField.borderStyle = UITextBorderStyleRoundedRect;
    _classTextField.delegate = self;
    _classTextField.textColor = [UIColor whiteColor];
    [_classTextField setBackgroundColor:[UIColor clearColor]];
    userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 3, 50, 50)];
    userImageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/StudentCommandSystem/banji.png"];
    _lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 3, 3, 40)];
    _lineImageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/StudentCommandSystem/line.png"];
    [_classTextField setValue:[NSNumber numberWithInt:57] forKey:@"paddingLeft"];
    [_classTextField addSubview:userImageView];
    [_classTextField addSubview:_lineImageView];
    [_buttonAll addSubview:_classTextField];

    
}

-(void) finish {
    if (_scoreTextField.text.length != 0 && _classTextField.text.length != 0) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确认修改？？" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self->_student.score = self->_scoreTextField.text;
            self->_student.classRoom = self->_classTextField.text;
            [self.delegate receiveStudent:self->_student];
            [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"输入不能为空！" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

-(void) dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void) textFieldDidBeginEditing:(UITextField *)textField
{
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@ "ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    //将视图的Y坐标向上移动，以使下面腾出地方用于软键盘的显示
    self.buttonAll.frame = CGRectMake(0, -200, self.buttonAll.frame.size.width, self.buttonAll.frame.size.height);
    [UIView commitAnimations];
}
//取消第一响应，也就是输入完毕，屏幕恢复原状
-( void )textFieldDidEndEditing:(UITextField *)textField
{
    //滑动效果
    [_scoreTextField resignFirstResponder];
    [_nameTextField resignFirstResponder];
    [_classTextField resignFirstResponder];
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@ "ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    //恢复屏幕
    self.buttonAll.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
    
}

@end
