//
//  ViewController.m
//  自定义cell
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 zjy. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "Contacts.h"
#define TEXTURL @"https://www.easy-mock.com/mock/5c126a2b3fe0c92bf174c51c/base_copy/nba"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,NSURLConnectionDataDelegate>

//声明大数组存放所有的联系人
@property (nonatomic, strong) NSMutableArray *allContackArray;
@property (nonatomic, strong) NSMutableData *allData;
@end

@implementation ViewController
//懒加载
-(NSMutableArray *)allContackArray{
    if (_allContackArray == nil) {
        _allContackArray = [NSMutableArray array];
    }
    return _allContackArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.tableView.backgroundColor = [UIColor lightGrayColor];
//    self.tableView.backgroundColor = [UIColor blueColor];
    [self handleData];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)handleData{
    //读取api文件
    NSURL *url = [NSURL URLWithString:TEXTURL];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];

    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
    NSLog(@"ok2323");
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSArray *key = [[_allContackArray objectAtIndex:section] allKeys];
    
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _allContackArray.count;//返回所有笑话的数目返回函数 分区
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    
    Contacts *contact = self.allContackArray[indexPath.section];
    //    cell.headerImageView.image = [UIImage imageNamed:contact.imageName];
    cell.nameLabel.text = contact.contant;
    cell.phoneLabel.text = contact.upDate;
    
//    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld",(long)indexPath.row]]];
  
    UIImage *imageHeader = [UIImage imageNamed:[NSString  stringWithFormat:@"%ld",indexPath.section]];
    cell.headPortrait.image = imageHeader;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

//    NSString *contentText= [[_allContackArray objectAtIndex:indexPath] valueForKey:@"content"];
    Contacts *contact = self.allContackArray[indexPath.section];
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"笑话文本是" message:contact.contant  delegate:self cancelButtonTitle:@"好的" otherButtonTitles: nil];
    [alert show];

}
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    NSString *str = @"笑话大全";
//    return str;
//}


#pragma mark - NSURLConnectionDataDelegate
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    if (_allData == nil) {
        _allData = [[NSMutableData alloc] init];
    }
    [_allData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    id obj = [NSJSONSerialization JSONObjectWithData:_allData options:0 error:nil];

    if ([obj isKindOfClass:[NSDictionary class]]) {
        NSArray *userinfo = [[[(NSDictionary *)obj objectForKey:@"data"] valueForKey:@"result"] valueForKey:@"data"];
//        NSLog(@"data:%@",userinfo);
        for (NSDictionary *contact in userinfo) {
            Contacts *conModel = [[Contacts alloc] init];
            [conModel setValuesForKeysWithDictionary:contact];
            //将文本和发布时间存到大数组里面
            [self.allContackArray addObject:conModel];
            NSLog(@"hahahaha");
        }

    }
    [self.tableView reloadData];
}


@end
