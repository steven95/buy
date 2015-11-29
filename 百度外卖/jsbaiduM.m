//
//  jsbaiduM.m
//  百度外卖
//
//  Created by Jusive on 15/11/10.
//  Copyright © 2015年 Jusive. All rights reserved.
//

#import "jsbaiduM.h"

@implementation jsbaiduM
-(instancetype)initWithdic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+(instancetype)baiduWithdic:(NSDictionary *)dic{
    return [[self alloc]initWithdic:dic];
}
@end
