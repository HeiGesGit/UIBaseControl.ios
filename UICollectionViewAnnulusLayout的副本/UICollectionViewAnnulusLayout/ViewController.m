//
//  ViewController.m
//  UICollectionViewAnnulusLayout
//
//  Created by Admin on 2018/12/2.
//  Copyright © 2018 itheima.com. All rights reserved.
//

#import "ViewController.h"
#import "AnnulusLayout.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AnnulusLayout *myLayout = [[AnnulusLayout alloc] init];
    UICollectionView *collect = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:myLayout];
    collect.delegate =self;
    collect.dataSource = self;
    [collect registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    [self.view addSubview:collect];
    

    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{//一个分区
    return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{//一个分区10个数据
    return 20;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];//设置cellID
    cell.layer.masksToBounds = YES;//
    cell.layer.cornerRadius = 25;
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    
    

    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld",indexPath.row]]];
    cell.backgroundView = imageView;
    
    return cell;
}
@end
