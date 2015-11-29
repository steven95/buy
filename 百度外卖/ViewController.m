//
//  ViewController.m
//  百度外卖
//
//  Created by Jusive on 15/11/10.
//  Copyright © 2015年 Jusive. All rights reserved.
//

#import "ViewController.h"
#import "jsbaiduM.h"
#import "jsbaiduViewcell.h"
#import "jsFooterView.h"
@interface ViewController ()<UITableViewDataSource,jsFooterViewDelegate,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *baidus;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
//MARK:懒加载
-(NSMutableArray *)baidus{
    if (_baidus == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        NSArray *arraydic = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dic in arraydic) {
            jsbaiduM *baidus = [jsbaiduM baiduWithdic:dic];
            [arrayM addObject:baidus];
        }
        _baidus = arrayM;
    }
    return _baidus;
}
//MARK:数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.baidus.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //取出模型
    jsbaiduM *baidus = self.baidus[indexPath.row];
    //创建cell
    jsbaiduViewcell *cell = [jsbaiduViewcell baiduViewcellWithTableView:tableView];
    cell.baidus = baidus;
    return cell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
    self.tableView.rowHeight = 80;
    //用xib创建foot
    jsFooterView *footerView = [jsFooterView footerView];
    footerView.delegate = self;
    self.tableView.tableFooterView = footerView;
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(BOOL)prefersStatusBarHidden{
    return 1;
}
-(void)clickjsFooterViewloadMoreBut:(jsFooterView *)jsFooterView{
    //添加数据
    jsbaiduM *baidu = [[jsbaiduM alloc] init];
    baidu.title = @"田老师红烧肉";
    baidu.price = @"18";
    baidu.buyCount = @"50";
    baidu.icon = @"9b437cdfb3e3b542b5917ce2e9a74890";
    [self.baidus addObject:baidu];
    //刷新数据
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:self.baidus.count-1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexpath] withRowAnimation:2];
     //让最后一行滚到屏幕最上方
    [self.tableView scrollToRowAtIndexPath:indexpath atScrollPosition:0 animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
