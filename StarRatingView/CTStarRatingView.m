//
//  CTStarRatingView.m
//  EBooking
//
//  Created by zp on 13/7/16.
//  Copyright © 2016年 Ctrip. All rights reserved.
//

#define kBACKGROUND_STAR @"grade-blue"
#define kFOREGROUND_STAR @"grade-gray"
#define kNUMBER_OF_STAR  5

#import "CTStarRatingView.h"

#define CTColorHex(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:((c)&0xFF)/255.0 alpha:1.0]


@interface CTStarRatingView ()

@property (nonatomic, strong) UIView *starBackgroundView;
@property (nonatomic, strong) UIView *starForegroundView;

@end

@implementation CTStarRatingView
{
    UIView* view;
    UILabel *animateLabel;//评分时动画显示分数
    UIImageView* iv1;
    UIImageView* iv2;
    UIImageView* iv3;
    UIImageView* iv4;
    UIImageView* iv5;

}
- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame starNum:kNUMBER_OF_STAR];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    _starNum = kNUMBER_OF_STAR;
    [self setUpUI];
}

/**
 *  初始化TQStarRatingView
 *
 *  @param frame  Rectangles
 *  @param number 星星个数
 *
 *  @return TQStarRatingViewObject
 */
- (id)initWithFrame:(CGRect)frame starNum:(int)starNum
{
    self = [super initWithFrame:frame];
    if (self) {
        _starNum = starNum;
        [self setUpUI];
    }
    return self;
}

-(void)setUpUI
{
//    self.starBackgroundView = [self getStarViewWithImageName:kBACKGROUND_STAR];
    self.starForegroundView = [self getStarViewWithImageName:kFOREGROUND_STAR];
    [self addSubview:self.starForegroundView];
}

/**
 *  通过图片构建星星视图
 *
 *  @param imageName 图片名称
 *
 *  @return 星星视图
 */
- (UIView *)getStarViewWithImageName:(NSString *)imageName
{
    CGRect frame = self.bounds;
    view = [[UIView alloc]initWithFrame:frame];
    view.clipsToBounds = YES;
    for (int i = 0; i < self.starNum; i++) {
        UIImageView* imageView = [[UIImageView alloc]init];
        imageView.tag = i + 1000;
        imageView.image = [UIImage imageNamed:imageName];
        if (i != 0) {
            imageView.frame = CGRectMake((i * frame.size.width / self.starNum) + 2,0, (frame.size.width -8)/self.starNum, frame.size.height);

        }
        else
        {
            imageView.frame = CGRectMake(i * frame.size.width / self.starNum,0, (frame.size.width-8)/self.starNum, frame.size.height);

        }
        [view addSubview:imageView];
    }
    return view;
}

//增加设置评论分数，根据从服务器获取到的分数进行展示有几个蓝色的圆点。
- (void)setScore:(float)score withTotalScore:(float)totalScore
{
    NSAssert((score >= 0.0)&&(score <= 1.0 * totalScore), @"score must be between 0 and 1");
    NSAssert(totalScore > 0.0, @"totalScore must be Greater than 0");
    
    if (score < 0)
    {
        score = 0;
    }
    if (score > totalScore)
    {
        score = totalScore;
    }

    CGPoint point = CGPointMake((score/totalScore) * self.frame.size.width, 0);
    [self changeStarForegroundViewWithPoint:point];
}

/**
 *  通过坐标改变前景视图
 *
 *  @param point 坐标
 */
- (void)changeStarForegroundViewWithPoint:(CGPoint)point
{
    CGPoint p = point;
    
    if (p.x < 0) {
        p.x = 0;
    }
    if (p.x > self.frame.size.width) {
        p.x = self.frame.size.width;
    }
    NSString* str = [NSString stringWithFormat:@"%0.2f",p.x/self.frame.size.width];
    float score = [str floatValue];
    p.x = score* self.frame.size.width;
    
    iv1 = (UIImageView*)[self.starForegroundView viewWithTag:1000];
    iv2 = (UIImageView*)[self.starForegroundView viewWithTag:1001];
    iv3 = (UIImageView*)[self.starForegroundView viewWithTag:1002];
    iv4 = (UIImageView*)[self.starForegroundView viewWithTag:1003];
    iv5 = (UIImageView*)[self.starForegroundView viewWithTag:1004];
    
    self.score = 0;
    if (p.x >=iv1.frame.origin.x && p.x <= iv1.frame.origin.x + iv1.frame.size.width){
        iv1.image = [UIImage imageNamed:kBACKGROUND_STAR];
        iv2.image = [UIImage imageNamed:kFOREGROUND_STAR];
        iv3.image = [UIImage imageNamed:kFOREGROUND_STAR];
        iv4.image = [UIImage imageNamed:kFOREGROUND_STAR];
        iv5.image = [UIImage imageNamed:kFOREGROUND_STAR];
        self.score = 1;

    }else if (p.x >=iv2.frame.origin.x && p.x <= iv2.frame.origin.x + iv2.frame.size.width){
        iv1.image = [UIImage imageNamed:kBACKGROUND_STAR];
        iv2.image = [UIImage imageNamed:kBACKGROUND_STAR];
        iv3.image = [UIImage imageNamed:kFOREGROUND_STAR];
        iv4.image = [UIImage imageNamed:kFOREGROUND_STAR];
        iv5.image = [UIImage imageNamed:kFOREGROUND_STAR];
        self.score = 2;

    }else if (p.x >=iv3.frame.origin.x && p.x <= iv3.frame.origin.x + iv3.frame.size.width){
        iv1.image = [UIImage imageNamed:kBACKGROUND_STAR];
        iv2.image = [UIImage imageNamed:kBACKGROUND_STAR];
        iv3.image = [UIImage imageNamed:kBACKGROUND_STAR];
        iv4.image = [UIImage imageNamed:kFOREGROUND_STAR];
        iv5.image = [UIImage imageNamed:kFOREGROUND_STAR];
        self.score = 3;

    }else if (p.x >=iv4.frame.origin.x && p.x <= iv4.frame.origin.x + iv4.frame.size.width){
        iv1.image = [UIImage imageNamed:kBACKGROUND_STAR];
        iv2.image = [UIImage imageNamed:kBACKGROUND_STAR];
        iv3.image = [UIImage imageNamed:kBACKGROUND_STAR];
        iv4.image = [UIImage imageNamed:kBACKGROUND_STAR];
        iv5.image = [UIImage imageNamed:kFOREGROUND_STAR];
        self.score = 4;

    }else if (p.x >=iv5.frame.origin.x && p.x <= iv5.frame.origin.x + iv5.frame.size.width){
        iv1.image = [UIImage imageNamed:kBACKGROUND_STAR];
        iv2.image = [UIImage imageNamed:kBACKGROUND_STAR];
        iv3.image = [UIImage imageNamed:kBACKGROUND_STAR];
        iv4.image = [UIImage imageNamed:kBACKGROUND_STAR];
        iv5.image = [UIImage imageNamed:kBACKGROUND_STAR];
        self.score = 5;

    }
}

/**
 *  点击的时候改变评分
 *
 *  @param point 坐标
 */
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    __weak __typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        [weakSelf changeStarForegroundViewWithPoint:point];
    }];
//    [self scoreAnimation];
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    if (CGRectContainsPoint(rect, point)) {
        [self changeStarForegroundViewWithPoint:point];
    }
}

-(void)scoreAnimation
{
//    self.userInteractionEnabled = NO;
    if (!animateLabel) {
        animateLabel = [UILabel new];
        animateLabel.bounds = CGRectMake(0, 0, 50, 20);
        animateLabel.textColor = CTColorHex(0x1171B7);
        animateLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:animateLabel];
    }
    animateLabel.text = [NSString stringWithFormat:@"%.0d",self.score];
    CGFloat centerX = 0;
    switch (self.score) {
        case 0:
            return;
            break;
        case 1:
            centerX = iv1.center.x;
            break;
        case 2:
            centerX = iv1.center.x;
            break;
        case 3:
            centerX = iv1.center.x;
            break;
        case 4:
            centerX = iv1.center.x;
            break;
        case 5:
            centerX = iv1.center.x;
            break;
        default:
            break;
    }
    animateLabel.center = CGPointMake(centerX, -5);
    animateLabel.alpha = 1;
    [UIView animateWithDuration:0.7 animations:^{
        animateLabel.center = CGPointMake(centerX, -20);
        animateLabel.alpha = 0;
    } completion:^(BOOL finished) {
//        self.userInteractionEnabled = YES;
    }];

}
@end
