//
//  jsFooterView.m
//  百度外卖
//
//  Created by Jusive on 15/11/10.
//  Copyright © 2015年 Jusive. All rights reserved.
//

#import "jsFooterView.h"
@interface jsFooterView()
@property (weak, nonatomic) IBOutlet UIButton *jsmoreButton;
@property (weak, nonatomic) IBOutlet UIView *jsView;
- (IBAction)jsmoreButton:(UIButton *)sender;

@end
@implementation jsFooterView
+(instancetype)footerView{
    //这步就是加载了jsFooterView.xib了
    return [[[NSBundle mainBundle]loadNibNamed:@"jsFooterView" owner:nil options:nil]lastObject];
}
- (IBAction)jsmoreButton:(UIButton *)sender {
    self.jsmoreButton.hidden = YES;
    self.jsView.hidden = NO;
    //延迟一段时间在执行的代码
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)3.0*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        //代理第三步判断代理是否实现
        if ([self.delegate respondsToSelector:@selector(clickjsFooterViewloadMoreBut:)]) {
            //调用代理
            [self.delegate clickjsFooterViewloadMoreBut:self];
     
        }
        
        self.jsmoreButton.hidden = NO;
         self.jsView.hidden = YES;
    });
}












@end
