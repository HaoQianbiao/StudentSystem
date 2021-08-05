//
//  SortViewController.m
//  StudentCommandSystem
//
//  Created by haoqianbiao on 2021/8/4.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "SortViewController.h"
#import "AddTableViewCell.h"
#import "Student.h"
@interface SortViewController ()

@end

@implementation SortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/StudentCommandSystem/WechatIMG52.jpeg"];
    [self.view insertSubview:imageView atIndex:0];
    
    UIButton* buttonExit = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonExit.frame = CGRectMake(170, 750, 80, 50);
    [buttonExit setTitle:@"back" forState:UIControlStateNormal];
    [buttonExit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buttonExit.titleLabel.font = [UIFont systemFontOfSize:35];
    [buttonExit addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonExit];
    
    Student* student = [[Student alloc] init];
    int count = (int)_studentArray.count;
    for (int i = 0; i < count - 1; i++) {
        for (int j = 0; j < count - i - 1; j++) {
            Student* student_1 = [_studentArray objectAtIndex:j + 1];
            Student* student_2 = [_studentArray objectAtIndex:j];
            int score_1 = [student_1.score intValue];
            int score_2 = [student_2.score intValue];
            if (score_1 > score_2) {
                student = [_studentArray objectAtIndex:j + 1];
                [_studentArray replaceObjectAtIndex:j + 1 withObject:[_studentArray objectAtIndex:j]];
                [_studentArray replaceObjectAtIndex:j withObject:student];
            }
        }
    }
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(25, 50, 350, _studentArray.count * 80) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView registerClass:[AddTableViewCell class] forCellReuseIdentifier:@"0"];
    [self.view addSubview:_tableView];
    
}

-(void) dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
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
