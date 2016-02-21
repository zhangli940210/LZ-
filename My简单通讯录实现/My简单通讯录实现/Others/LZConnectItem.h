//
//  LZConnectItem.h
//  My简单通讯录实现
//
//  Created by apple on 16/2/21.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZConnectItem : NSObject

/** 姓名*/
@property (nonatomic, strong) NSString *name;
/** 电话*/
@property (nonatomic, strong) NSString *phone;

// 快速创建对象方法
+ (instancetype)connectItemWithName:(NSString *)name phone:(NSString *)phone;

@end
