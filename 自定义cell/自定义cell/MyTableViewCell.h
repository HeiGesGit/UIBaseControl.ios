//
//  MyTableViewCell.h
//  自定义cell
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 zjy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
//联系人头像
@property (nonatomic, strong) UIImageView *headPortrait;
//联系人姓名label
@property (nonatomic, strong) UILabel *nameLabel;
//电话号码的Label
@property (nonatomic, strong) UILabel *phoneLabel;

@end
