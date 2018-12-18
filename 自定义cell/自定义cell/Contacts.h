//
//  Contacts.h
//  自定义cell
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 zjy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contacts : NSObject

//文本
@property (nonatomic, strong) NSString *contant;
//上传时间
@property (nonatomic, strong) NSString *upDate;
//图片名
//@property (nonatomic, strong) UIImage *imageName;

-(void)setValue:(id)value forUndefinedKey:(NSString *)key;
@end
