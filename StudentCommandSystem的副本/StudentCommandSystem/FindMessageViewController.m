//
//  FindMessageViewController.m
//  StudentCommandSystem
//
//  Created by haoqianbiao on 2021/8/2.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "FindMessageViewController.h"
#import "AddTableViewCell.h"
@interface FindMessageViewController ()

@end

@implementation FindMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/StudentCommandSystem/background.jpeg"]];
    [self.view insertSubview:imageView atIndex:0];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, 300, 80)];
    _label.text = @"您查找的学生信息为：";
    _label.font = [UIFont systemFontOfSize:25];
    _label.textColor = [UIColor whiteColor];
    [self.view addSubview:_label];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(25, 250, 350, 80) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView registerClass:[AddTableViewCell class] forCellReuseIdentifier:@"0"];
    [self.view addSubview:_tableView];
    
    UIButton* buttonExit = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonExit setTitle:@"BACK" forState:UIControlStateNormal];
    [buttonExit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonExit addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    buttonExit.titleLabel.font = [UIFont systemFontOfSize:25];
    buttonExit.frame = CGRectMake(300, 500, 70, 50);
    [self.view addSubview:buttonExit];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AddTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"0" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.nameLabel.text = _student.name;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.classLabel.text = _student.classRoom;
    cell.scoreLabel.text = _student.score;
    return cell;
}

-(void) dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
