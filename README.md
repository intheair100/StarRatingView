# StarRatingView
星级评分，评分，starRate
这是一款星级评分的视图，可以直接拿出来用。
使用方法：
初始化的时候调用下面的方法就好，然后addsubview到你所需要的View上面。
/**
 *  初始化StarRatingView
 *
 *  @param frame  Rectangles
 *  @param number 星星个数
 *  @param isShowAnimation  点击评分的时候是否有类似游戏里面的加分动画
 *  @return TQStarRatingViewObject
 */
- (id)initWithFrame:(CGRect)frame starNum:(int)starNum isShowAnimation:(BOOL)isShowAnimation


