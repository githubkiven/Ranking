//
//  RankingTableViewCell.h
//  Ranking
//
//  Created by smppw_zwq on 2020/6/3.
//  Copyright © 2020 smppw_zwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kScreenHeight         [[UIScreen mainScreen] bounds].size.height
// 获取屏幕宽度 即:整屏的宽度
#define kScreenWidth            [[UIScreen mainScreen] bounds].size.width

NS_ASSUME_NONNULL_BEGIN

@interface RankingTableViewCell : UITableViewCell<UIScrollViewDelegate>

@property(nonatomic,strong)UILabel * nameLabel;
@property(nonatomic,strong)UIScrollView * cellScrollerView;


@end

NS_ASSUME_NONNULL_END
