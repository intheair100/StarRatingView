//
//  CTStarRatingView.h
//  EBooking
//  评分功能
//  Created by zp on 13/7/16.
//  Copyright © 2016年 Ctrip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTStarRatingView : UIView

@property(nonatomic, readonly)int starNum;
@property(nonatomic, assign)int score;


-(id)initWithFrame:(CGRect)frame starNum:(int)starNum;

- (void)setScore:(float)score withTotalScore:(float)totalScore;


@end
