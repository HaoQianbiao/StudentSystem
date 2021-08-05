//
//  FindMessageViewController.h
//  StudentCommandSystem
//
//  Created by haoqianbiao on 2021/8/2.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
NS_ASSUME_NONNULL_BEGIN

@interface FindMessageViewController : UIViewController
<UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) UILabel* label;
@property (nonatomic, strong) UITableView* tableView;
@property Student* student;
@end

NS_ASSUME_NONNULL_END
