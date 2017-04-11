//
//  ViewController.m
//  StarRatingView
//
//  Created by Mac on 16/7/31.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "ViewController.h"
#import "CTStarRatingView.h"
@interface ViewController ()
@property(nonatomic,strong)CTStarRatingView* starRatingView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.starRatingView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CTStarRatingView*)starRatingView
{
    if (!_starRatingView) {
        _starRatingView = [[CTStarRatingView alloc]initWithFrame:CGRectMake(100,300, 98, 18) starNum:6];
    }
    return _starRatingView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
