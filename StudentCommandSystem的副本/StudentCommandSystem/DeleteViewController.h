//
//  DeleteViewController.h
//  StudentCommandSystem
//
//  Created by haoqianbiao on 2021/8/2.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol DeleteViewControllerDelegate <NSObject>
//
//-(void) receiveStudentDelete:(NSMutableArray*) student;
//
//@end

@interface DeleteViewController : UIViewController
<UITextFieldDelegate,
UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray* studentArray;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UIButton* buttonAll;
@property (nonatomic, strong) UITextField* nameTextField;
@property (nonatomic, strong) UIImageView* lineImageView;
@property (nonatomic, strong) UIButton* finishButton;
@property BOOL select;
//@property (nonatomic, assign) id<DeleteViewControllerDelegate> delegate;
@end


