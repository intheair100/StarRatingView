//
//  CTStarRatingView.h
//  EBooking
//  评分功能
//  Created by zp on 13/7/16.
//  Copyright © 2016年 Ctrip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTStarRatingView : UIView

@property(nonatomic, readonly)int starNum; //圆点个数
@property(nonatomic, assign)int score; //分数
@property(nonatomic, assign)BOOL isShowAnimation; //是否有点击动画



- (id)initWithFrame:(CGRect)frame starNum:(int)starNum isShowAnimation:(BOOL)isShowAnimation;

- (void)setScore:(float)score withTotalScore:(float)totalScore;


@end
