//
//  ViewController.m
//  Ranking
//
//  Created by smppw_zwq on 2020/6/3.
//  Copyright © 2020 smppw_zwq. All rights reserved.
//

#import "ViewController.h"

#import "RankingTableViewCell.h"


#define kScreenHeight         [[UIScreen mainScreen] bounds].size.height
// 获取屏幕宽度 即:整屏的宽度
#define kScreenWidth            [[UIScreen mainScreen] bounds].size.width
#define kNavHeight   ([[UIApplication sharedApplication] statusBarFrame].size.height+44)

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,strong)UITableView * rankingTableView;


@end

@implementation ViewController


#pragma mark -------- Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"排行左右滑动";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.rankingTableView];
    


}



#pragma mark -------- ReuqestData
#pragma mark -------- CreatUI
#pragma mark -------- Delegate
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;{
    
    return 50;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    
    RankingTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        
        cell = [[RankingTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;

    
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;{
    
    return 45;
    
}

#pragma mark - UITextFieldDelegate
#pragma mark - otherDelegate

#pragma mark -------- Private Methods

#pragma mark -------- Events

#pragma mark -------- Getters and Setters
- (UITableView *)rankingTableView{
    
    if (!_rankingTableView) {
         
        _rankingTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _rankingTableView.dataSource = self;
        _rankingTableView.delegate = self;
        
    }
    
    return _rankingTableView;
    
    
    
}



@end
