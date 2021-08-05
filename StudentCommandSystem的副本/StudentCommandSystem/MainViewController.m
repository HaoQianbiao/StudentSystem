//
//  MainViewController.m
//  StudentCommandSystem
//
//  Created by haoqianbiao on 2021/8/1.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "MainViewController.h"
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "ChangeViewController.h"
#import "FindViewController.h"
#import "AddTableViewCell.h"
#import "SortViewController.h"
#import "Student.h"
@interface MainViewController ()

@end

@implementation MainViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/StudentCommandSystem/WechatIMG52.jpeg"]];
    [self.view insertSubview:imageView atIndex:0];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(30, 20, 370, 450) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView registerClass:[AddTableViewCell class] forCellReuseIdentifier:@"0"];
    [self.view addSubview:_tableView];
    
    UIButton* buttonAdd = [[UIButton alloc] initWithFrame:CGRectMake(55, 550, 70, 50)];
    [buttonAdd setTitle:@"add" forState:UIControlStateNormal];
    buttonAdd.titleLabel.font = [UIFont systemFontOfSize:30];
    [buttonAdd setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonAdd addTarget:self action:@selector(pressToAdd) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonAdd];
    
    UIButton* buttonDelete = [[UIButton alloc] initWithFrame:CGRectMake(230, 550, 150, 50)];
    buttonDelete.titleLabel.textAlignment = NSTextAlignmentLeft;
    [buttonDelete setTitle:@"delete" forState:UIControlStateNormal];
    buttonDelete.titleLabel.font = [UIFont systemFontOfSize:30];
    [buttonDelete addTarget:self action:@selector(pressToDelete) forControlEvents:UIControlEventTouchUpInside];
    [buttonDelete setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:buttonDelete];
    
    UIButton* buttonChange = [[UIButton alloc] initWithFrame:CGRectMake(30, 650, 150, 50)];
    [buttonChange setTitle:@"change" forState:UIControlStateNormal];
    buttonChange.titleLabel.font = [UIFont systemFontOfSize:30];
    [buttonChange setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonChange addTarget:self action:@selector(pressToChange) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonChange];
    
    UIButton* buttonFind = [[UIButton alloc] initWithFrame:CGRectMake(270, 650, 70, 50)];
    [buttonFind setTitle:@"find" forState:UIControlStateNormal];
    buttonFind.titleLabel.font = [UIFont systemFontOfSize:30];
    [buttonFind setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonFind addTarget:self action:@selector(pressToFind) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonFind];
    
    UIButton* buttonSort= [[UIButton alloc] initWithFrame:CGRectMake(70, 750, 70, 50)];
    [buttonSort setTitle:@"sort" forState:UIControlStateNormal];
    buttonSort.titleLabel.font = [UIFont systemFontOfSize:30];
    [buttonSort setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonSort addTarget:self action:@selector(pressToSort) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonSort];
    
    UIButton* buttonExit= [[UIButton alloc] initWithFrame:CGRectMake(280, 750, 70, 50)];
    [buttonExit setTitle:@"exit" forState:UIControlStateNormal];
    buttonExit.titleLabel.font = [UIFont systemFontOfSize:30];
    [buttonExit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonExit addTarget:self action:@selector(pressToExit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonExit];
    
    NSArray* arrayInformation = [[NSArray alloc] initWithObjects:@"张三",  @"85",  @"A班", @"李四", @"65",  @"B班",  @"王五", @"76", @"C班", @"赵六", @"99",  @"D班", nil];
    
    _studentArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 4; i++) {
        Student* student = [[Student alloc] init];
        student.name = [arrayInformation objectAtIndex:i * 3];
        student.score = [arrayInformation objectAtIndex:i * 3 + 1];
        student.classRoom = [arrayInformation objectAtIndex:i * 3 + 2] ;
        [_studentArray addObject:student];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifyHandle:) name:@"transDataNoti" object:nil];
}


//协议传值
-(void) pressToAdd {
    AddViewController* add = [[AddViewController alloc] init];
    add.studentArray = [NSMutableArray arrayWithArray: _studentArray];
    add.delegate = self;
    [self presentViewController:add animated:YES completion:nil];
}

-(void) receiveStudentAdd:(NSMutableArray *)student {
    _studentArray = student;
    [_tableView reloadData];
}


//-(void) pressToDelete {
//    DeleteViewController* delete = [[DeleteViewController alloc] init];
//    delete.delegate = self;
//    delete.studentArray = _studentArray;
//    [self presentViewController:delete animated:YES completion:nil];
//}

//“删除“传回的数据
//-(void) receiveStudentDelete:(NSMutableArray *)student {
//    _studentArray = student;
//    [_tableView reloadData];
//}

//通知传值
-(void) pressToDelete {
    DeleteViewController* delete = [[DeleteViewController alloc] init];
    delete.studentArray = [NSMutableArray arrayWithArray: _studentArray];
    [self presentViewController:delete animated:YES completion:nil];
}

-(void) notifyHandle:(NSNotification*) notification {
    self->_studentArray = notification.userInfo[@"content"];
    [_tableView reloadData];
}
-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


//-(void) pressToChange {
//    ChangeViewController* change = [[ChangeViewController alloc] init];
//    change.delegate = self;
//    change.studentArray = _studentArray;
//    [self presentViewController:change animated:YES completion:nil];
//}

//"修改"传回的数据
//协议传值
//-(void) receiveStudentChange:(NSMutableArray *)student {
//    _studentArray = student;
//    [_tableView reloadData];
//}

//block传值
-(void) pressToChange {
    ChangeViewController* change = [[ChangeViewController alloc] init];
    change.studentArray = [NSMutableArray arrayWithArray: _studentArray];
    change.transDataBlock = ^(NSMutableArray *studentArray) {
        self.studentArray = studentArray;
        [self->_tableView reloadData];
    };
    [self presentViewController:change animated:YES completion:nil];
}


-(void) pressToFind {
    FindViewController* find = [[FindViewController alloc] init];
    find.studentArray = _studentArray;
    [self presentViewController:find animated:YES completion:nil];
}

-(void) pressToSort {
    SortViewController* sort = [[SortViewController alloc] init];
    sort.studentArray = [NSMutableArray arrayWithArray: _studentArray];
    [self presentViewController:sort animated:YES completion:nil];
}

-(void) pressToExit {
    [[UIApplication sharedApplication]
     performSelector:@selector(suspend)];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _studentArray.count;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AddTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"0" forIndexPath:indexPath];
    Student* student = [_studentArray objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.nameLabel.text = student.name;
    cell.classLabel.text = student.classRoom;
    cell.scoreLabel.text = student.score;
    return cell;
}

@end
