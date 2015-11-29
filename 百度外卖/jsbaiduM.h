//
//  jsbaiduM.h
//  百度外卖
//
//  Created by Jusive on 15/11/10.
//  Copyright © 2015年 Jusive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface jsbaiduM : NSObject
@property (nonatomic,copy) NSString *buyCount;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *price;
-(instancetype)initWithdic:(NSDictionary *)dic;
+(instancetype)baiduWithdic:(NSDictionary *)dic;
@end
