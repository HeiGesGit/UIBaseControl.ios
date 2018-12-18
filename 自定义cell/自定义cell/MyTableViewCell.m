//
//  MyTableViewCell.m
//  自定义cell
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 zjy. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //初始化子视图
        [self initLayout];
    }
    return self;
}
-(void)initLayout{
    //头像
    self.headPortrait = [[UIImageView alloc] initWithFrame:CGRectMake(16, 10, 100, 100)];
    self.headPortrait.layer.masksToBounds = YES;//超出视图的部分就截除
    self.headPortrait.layer.cornerRadius =50;//设置半径
    [self.contentView addSubview:self.headPortrait];
    
    //文本
    //返回CGRectGetMaxX右边的坐标
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake((CGRectGetMaxX(self.headPortrait.frame) + 10), CGRectGetMinY(self.headPortrait.frame), 260, 80)];
//    NSLog(@"%f",(CGRectGetMaxX(self.headerImageView.frame)));
    _nameLabel.numberOfLines = 0;
    
    [self.contentView addSubview:self.nameLabel];
    
    //发布时间
    self.phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.nameLabel.frame),CGRectGetMaxY(self.nameLabel.frame), 200, 40)];
    
    [self.contentView addSubview:_phoneLabel];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
