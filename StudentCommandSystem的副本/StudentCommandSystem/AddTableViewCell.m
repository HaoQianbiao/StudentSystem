//
//  AddTableViewCell.m
//  StudentCommandSystem
//
//  Created by haoqianbiao on 2021/8/2.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "AddTableViewCell.h"

@implementation AddTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.textColor = [UIColor whiteColor];
    _nameLabel.font = [UIFont systemFontOfSize:23];
    [self.contentView addSubview:_nameLabel];
    
    _classLabel = [[UILabel alloc] init];
    _classLabel.textColor = [UIColor whiteColor];
    _classLabel.font = [UIFont systemFontOfSize:23];
    [self.contentView addSubview:_classLabel];
    
    _scoreLabel = [[UILabel alloc] init];
    _scoreLabel.textColor = [UIColor whiteColor];
    _scoreLabel.font = [UIFont systemFontOfSize:23];
    [self.contentView addSubview:_scoreLabel];
    
    return self;
}

-(void) layoutSubviews {
    [super layoutSubviews];
    
    _nameLabel.frame = CGRectMake(25, 20, 100, 50);
    _classLabel.frame = CGRectMake(150, 20, 100, 50);
    _scoreLabel.frame = CGRectMake(295, 20, 100, 50);
}
@end
