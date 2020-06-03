//
//  RankingTableViewCell.m
//  Ranking
//
//  Created by smppw_zwq on 2020/6/3.
//  Copyright © 2020 smppw_zwq. All rights reserved.
//

#import "RankingTableViewCell.h"

@implementation RankingTableViewCell{
    
    NSString*_reuseIdentifier;
    BOOL _havePostNotification;

}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 45)];
        self.nameLabel.text = @"排列序号";
        self.nameLabel.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:self.nameLabel];
        
        
        self.cellScrollerView= [[UIScrollView alloc]initWithFrame:CGRectMake(5+15+5+100, 0, kScreenWidth-100-25-20, 45)];
        self.cellScrollerView.showsVerticalScrollIndicator = NO;
        self.cellScrollerView.showsHorizontalScrollIndicator = NO;
        self.cellScrollerView.contentSize = CGSizeMake(660, 45);
        self.cellScrollerView.backgroundColor = [UIColor purpleColor];
        self.cellScrollerView.delegate = self;
        [self.contentView addSubview:self.cellScrollerView];
        
        
        UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 45)];
        contentLabel.text = @"累计收益:80%";
        contentLabel.backgroundColor = [UIColor yellowColor];
        [self.cellScrollerView addSubview:contentLabel];

        UILabel *earningsLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 0, 120, 45)];
        earningsLabel.text = @"单位净值:80%";
        earningsLabel.backgroundColor = [UIColor orangeColor];
        [self.cellScrollerView addSubview:earningsLabel];

        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(InfoNotificationAction:) name:@"companyScrollerViewContentOffset" object:nil];

         
    }
    
    return self;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (!_havePostNotification) {
        // 发送通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"companyScrollerViewContentOffset" object:self userInfo:@{@"contentOffsetX":@(scrollView.contentOffset.x)}];
    }
    _havePostNotification = NO;
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    _havePostNotification = NO;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    _havePostNotification = NO;
}
- (void)InfoNotificationAction:(NSNotification *)notification{
    // object 就是传过来的参数
    NSDictionary *noticeInfo = notification.userInfo;
    NSObject *obj = notification.object;
    float x = [noticeInfo[@"contentOffsetX"] floatValue];
    if (obj!=self) {
        _havePostNotification = YES;
        [_cellScrollerView setContentOffset:CGPointMake(x, 0) animated:NO];
    }else{
        _havePostNotification = NO;
    }
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
