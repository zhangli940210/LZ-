//
//  LZConnectItem.m
//  My简单通讯录实现
//
//  Created by apple on 16/2/21.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZConnectItem.h"

@implementation LZConnectItem

+ (instancetype)connectItemWithName:(NSString *)name phone:(NSString *)phone
{
    LZConnectItem *item = [[LZConnectItem alloc] init];
    item.name = name;
    item.phone = phone;
    return item;
}

@end
