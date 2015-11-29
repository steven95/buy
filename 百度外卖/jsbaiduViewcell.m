//
//  jsbaiduViewcell.m
//  百度外卖
//
//  Created by Jusive on 15/11/10.
//  Copyright © 2015年 Jusive. All rights reserved.
//

#import "jsbaiduViewcell.h"
#import "jsbaiduM.h"
@interface jsbaiduViewcell()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewcell;
@property (weak, nonatomic) IBOutlet UILabel *titlecell;
@property (weak, nonatomic) IBOutlet UILabel *pricecell;
@property (weak, nonatomic) IBOutlet UILabel *buycountcell;

@end
@implementation jsbaiduViewcell
//创建xib中的cell方法的实现
+(instancetype)baiduViewcellWithTableView:(UITableView *)tableView{
    static  NSString *ID = @"baidu_cell";
    //给cell设置一个ID标志方便从缓冲池中重用
    jsbaiduViewcell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //判断缓冲池是否有可用的cell
    if (cell == nil) {
        //加载xib文件并同时创建cell
        cell = [[[NSBundle mainBundle]loadNibNamed:@"jsbaiduViewcell" owner:nil options:nil]lastObject];
    }
    return cell;
}
//重写模型属性的set方法
-(void)setBaidus:(jsbaiduM *)baidus{
    //一定要将重写的属性赋给原值
    _baidus = baidus;
    self.titlecell.text = baidus.title;
self.imageViewcell.image = [UIImage imageNamed:baidus.icon];
    self.buycountcell.text = [NSString stringWithFormat:@"%@",baidus.buyCount];
    self.pricecell.text = [NSString stringWithFormat:@"%@",baidus.price];
    
}
@end
