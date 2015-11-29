//
//  jsFooterView.h
//  百度外卖
//
//  Created by Jusive on 15/11/10.
//  Copyright © 2015年 Jusive. All rights reserved.
//

#import <UIKit/UIKit.h>
@class jsFooterView;
//编写代理第一步,定义一个代理
@protocol jsFooterViewDelegate <NSObject>
-(void)clickjsFooterViewloadMoreBut:(jsFooterView *)jsFooterView;
@end
@interface jsFooterView : UIView
//编写代理第二步,添加一个代理方法/Users/jusive/Documents/百度外卖/百度外卖
@property (nonatomic,weak)id <jsFooterViewDelegate>delegate;
+(instancetype)footerView;
@end
