//
//  LZAddViewController.h
//  My简单通讯录实现
//
//  Created by apple on 16/2/21.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LZAddViewController, LZConnectItem;
@protocol LZAddViewControllerDelegate <NSObject>

@optional
- (void)addViewController:(LZAddViewController *)addViewController connetItem:(LZConnectItem *)connetItem;

@end

@interface LZAddViewController : UIViewController

/** 模型数据*/
@property (nonatomic, strong) LZConnectItem *item;
/** 代理属性*/
@property (nonatomic, weak) id<LZAddViewControllerDelegate> delegate;

@end
