//
//  jsbaiduViewcell.h
//  百度外卖
//
//  Created by Jusive on 15/11/10.
//  Copyright © 2015年 Jusive. All rights reserved.
//

#import <UIKit/UIKit.h>
@class jsbaiduM;
@interface jsbaiduViewcell : UITableViewCell
@property (nonatomic,strong)jsbaiduM *baidus;
+(instancetype)baiduViewcellWithTableView:(UITableView *)tableView;
@end
