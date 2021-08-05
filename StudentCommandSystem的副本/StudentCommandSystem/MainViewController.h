//
//  MainViewController.h
//  StudentCommandSystem
//
//  Created by haoqianbiao on 2021/8/1.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "ChangeViewController.h"
@interface MainViewController : UIViewController
<
AddViewControllerDelegate,
//DeleteViewControllerDelegate,
//ChangeViewControllerDelegate,
UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, copy) NSMutableArray* studentArray;
@end


