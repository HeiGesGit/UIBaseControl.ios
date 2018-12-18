//
//  Contacts.m
//  自定义cell
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 zjy. All rights reserved.
//

#import "Contacts.h"

@implementation Contacts
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"updatetime"]) {
        self.upDate = value;
    }
    if ([key isEqualToString:@"content"]) {
        self.contant = value;
    }
}



@end
