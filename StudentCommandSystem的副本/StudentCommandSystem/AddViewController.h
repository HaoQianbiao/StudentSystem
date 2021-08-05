//
//  AddViewController.h
//  StudentCommandSystem
//
//  Created by haoqianbiao on 2021/8/2.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddViewControllerDelegate <NSObject>

-(void) receiveStudentAdd:(NSMutableArray*) student;

@end

@interface AddViewController : UIViewController
<UITextFieldDelegate,
UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) UIButton* buttonAll;
@property (nonatomic, strong) UITextField* nameTextField;
@property (nonatomic, strong) UITextField* scoreTextField;
@property (nonatomic, strong) UITextField* classTextField;
@property (nonatomic, strong) UIImageView* lineImageView;
@property (nonatomic, strong) UIButton* finishButton;
@property (nonatomic, strong) NSMutableArray* studentArray;
@property (nonatomic, strong) UITableView* tableView;
@property BOOL selected;
@property (nonatomic, assign) id<AddViewControllerDelegate> delegate;


@end


