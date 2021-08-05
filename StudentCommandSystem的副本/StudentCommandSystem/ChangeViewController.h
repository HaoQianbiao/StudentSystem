//
//  ChangeViewController.h
//  StudentCommandSystem
//
//  Created by haoqianbiao on 2021/8/2.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangeMessageViewController.h"

//@protocol ChangeViewControllerDelegate <NSObject>
//
//-(void) receiveStudentChange:(NSMutableArray*) student;
//
//@end
typedef void (^TransDataBlock)(NSMutableArray* studentArray);
@interface ChangeViewController : UIViewController
<
ChangeMessageViewControllerDelegate,
UITextFieldDelegate,
UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UIButton* buttonAll;
@property (nonatomic, strong) UITextField* nameTextField;
@property (nonatomic, strong) UIImageView* lineImageView;
@property (nonatomic, strong) UIButton* finishButton;
@property (nonatomic, strong) NSMutableArray* studentArray;
@property (nonatomic, copy) TransDataBlock transDataBlock;
@property int index;;
@property BOOL select;
//@property (nonatomic, assign) id <ChangeViewControllerDelegate> delegate;
@end

