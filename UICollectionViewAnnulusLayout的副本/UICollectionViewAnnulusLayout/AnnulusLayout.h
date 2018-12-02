//
//  AnnulusLayout.h
//  UICollectionViewAnnulusLayout
//
//  Created by Admin on 2018/12/2.
//  Copyright © 2018 itheima.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AnnulusLayout : UICollectionViewLayout<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, assign) int itemCount;
@end

NS_ASSUME_NONNULL_END
