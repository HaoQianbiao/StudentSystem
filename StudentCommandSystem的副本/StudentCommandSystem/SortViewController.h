//
//  SortViewController.h
//  StudentCommandSystem
//
//  Created by haoqianbiao on 2021/8/4.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SortViewController : UIViewController
<UITableViewDataSource,
UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray* studentArray;
@property (nonatomic, strong) UITableView* tableView;

@end


