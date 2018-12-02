//
//  AnnulusLayout.m
//  UICollectionViewAnnulusLayout
//
//  Created by Admin on 2018/12/2.
//  Copyright © 2018 itheima.com. All rights reserved.
//

#import "AnnulusLayout.h"

@implementation AnnulusLayout
{
    NSMutableArray *_attributeArray;
}
-(void)prepareLayout{
    [super prepareLayout];
    //获取items在分区下标为0的时候的个数
    _itemCount = (int)[self.collectionView numberOfItemsInSection:0];
    _attributeArray = [[NSMutableArray alloc] init];//初始化实例变量
    //先设定大圆的半径 取长和宽最短的？啥意思
    CGFloat radius = MIN(self.collectionView.frame.size.width, self.collectionView.frame.size.height)/2;
    //计算圆心位置
    CGPoint center = CGPointMake(self.collectionView.frame.size.width/2, self.collectionView.frame.size.height/2);
    //设置每个item的大小为50*50 半斤为25
    for (int i=0; i<_itemCount; i++) {
        UICollectionViewLayoutAttributes *attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        //设置items的大小
        attris.size = CGSizeMake(50, 50);
        //计算每个item的圆心位置
        
        
        
        
        
        
        //计算每个item中心的坐标
        //算出的x，y值还要减去item自身半径的大小
        
        float x = center.x+cos(2*M_PI/_itemCount*i)*(radius-25);
        float y = center.y+sin(2*M_PI/_itemCount*i)*(radius-25);
        
        attris.center =CGPointMake(x, y);
        [_attributeArray addObject:attris];
    }
}
//设置内容区域的大小
-(CGSize)collectionViewContentSize{
    return self.collectionView.frame.size;
}
//返回设置数组
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return _attributeArray;
}


@end
