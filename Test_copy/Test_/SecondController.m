//
//  SecondController.m
//  Test_
//
//  Created by rong on 15/10/20.
//  Copyright (c) 2015年 rong. All rights reserved.
//

#import "SecondController.h"

//5
//320
//568

//6
//375
//667

/**
 *  屏幕宽度
 */
#define  SCREEN_WIDTH                 [UIScreen mainScreen].bounds.size.width
/**
 *  屏幕高度
 */
#define  SCREEN_HEIGHT                [UIScreen mainScreen].bounds.size.height

/**
 *  等比缩放比例
 */
#define VERTIAL_SCALE                 SCREEN_HEIGHT/667.0
#define HORIZONTAL_SCALE              SCREEN_WIDTH/375.0


/**
 *  实际宽、高
 */

#define CHANGED_HEIGH_(Y)              Y*VERTIAL_SCALE
#define CHANGED_WIDTH_(X)              X*HORIZONTAL_SCALE

@interface SecondController ()

@property (nonatomic, strong) UIImageView           *publishSuccessImage;       //对勾Image
@property (nonatomic, strong) UILabel               *publishTitleLable;         //发布成功lable
@property (nonatomic, strong) UIImageView           *exhibitionImageView;       //展览封面
@property (nonatomic, strong) UIImageView           *leftSepatateImageView;     //坐分割image
@property (nonatomic, strong) UILabel               *exhibitionShareLable;      //展览分享lable
@property (nonatomic, strong) UIImageView           *rightSepareteImageView;    //右分割Image
@property (nonatomic, strong) UIButton              *sinaShareButton;           //新浪分享按钮
@property (nonatomic, strong) UIButton              *weixinShareButton;         //微信分享按钮
@property (nonatomic, strong) UILabel               *sinaShareLable;            //新浪分享lable
@property (nonatomic, strong) UILabel               *weixinShareLable;          //微信分享lable
@property (nonatomic, strong) UIButton              *bakeToHomeButton;          //返回首页按钮

@end

@implementation SecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)setUI {
    self.view.backgroundColor = [UIColor blackColor];
//    self.navigationController.navigationBar.hidden = YES;
    
    [self.view addSubview:self.exhibitionImageView];
    [self.view addSubview:self.publishSuccessImage];
    [self.view addSubview:self.publishTitleLable];
    [self.view addSubview:self.leftSepatateImageView];
    [self.view addSubview:self.exhibitionShareLable];
    [self.view addSubview:self.rightSepareteImageView];
    [self.view addSubview:self.sinaShareButton];
    [self.view addSubview:self.weixinShareButton];
    [self.view addSubview:self.sinaShareLable];
    [self.view addSubview:self.weixinShareLable];
}

#pragma mark - setter and getter 

/**
 *  @property (nonatomic, strong) UIImageView           *publishSuccessImage;       //对勾Image
 @property (nonatomic, strong) UILabel               *publishTitleLable;         //发布成功lable
 @property (nonatomic, strong) UIImageView           *exhibitionImageView;       //展览封面
 @property (nonatomic, strong) UIImageView           *leftSepatateImageView;     //坐分割image
 @property (nonatomic, strong) UILabel               *exhibitionShareLable;      //展览分享lable
 @property (nonatomic, strong) UIImageView           *rightSepareteImageView;    //右分割Image
 @property (nonatomic, strong) UIButton              *sinaShareButton;           //新浪分享按钮
 @property (nonatomic, strong) UIButton              *weixinShareButton;         //微信分享按钮
 @property (nonatomic, strong) UILabel               *sinaShareLable;            //新浪分享lable
 @property (nonatomic, strong) UILabel               *weixinShareLable;          //微信分享lable
 @property (nonatomic, strong) UIButton              *bakeToHomeButton;          //返回首页按钮
 *
 *  @return
 */

-(UIImageView *)exhibitionImageView {
    if (!_exhibitionImageView) {
        _exhibitionImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CHANGED_WIDTH_(77.5), self.publishSuccessImage.frame.origin.y+self.publishSuccessImage.frame.size.height+CHANGED_HEIGH_(25.0),CHANGED_WIDTH_(220.0), CHANGED_HEIGH_(278.5))];
        _exhibitionImageView.backgroundColor = [UIColor yellowColor];
        _exhibitionImageView.image = [UIImage imageNamed:@"icon_templateDetial"];
    }
    return _exhibitionImageView;
}

-(UIImageView *)publishSuccessImage {
    if (!_publishSuccessImage) {
        _publishSuccessImage = [[UIImageView alloc]initWithFrame:CGRectMake(CHANGED_WIDTH_(120.0), CHANGED_HEIGH_(90.0), CHANGED_WIDTH_(30.0), CHANGED_HEIGH_(30.0))];
        _publishSuccessImage.image = [UIImage imageNamed:@"icon_-exh_succ"];
    }
    return _publishSuccessImage;
}

-(UILabel *)publishTitleLable {
    if (!_publishTitleLable) {
        _publishTitleLable = [[UILabel alloc]initWithFrame:CGRectMake(self.publishSuccessImage.frame.origin.x+self.publishSuccessImage.frame.size.width+CHANGED_WIDTH_(12.0), CHANGED_HEIGH_(94.0), CHANGED_WIDTH_(100), CHANGED_HEIGH_(30))];
        _publishTitleLable.text = @"发布成功";
        _publishTitleLable.textColor = [UIColor redColor];
        
    }
    return _publishTitleLable;
}

-(UIImageView *)leftSepatateImageView {
    if (!_leftSepatateImageView) {
        _leftSepatateImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.exhibitionImageView.frame.origin.x, self.exhibitionImageView.frame.origin.y+self.exhibitionImageView.frame.size.height+CHANGED_HEIGH_(40), CHANGED_WIDTH_(50), CHANGED_HEIGH_(1))];
        _leftSepatateImageView.backgroundColor = [UIColor whiteColor];
    }
    return _leftSepatateImageView;
}

-(UILabel *)exhibitionShareLable {
    if (!_exhibitionShareLable) {
        _exhibitionShareLable = [[UILabel alloc]initWithFrame:CGRectMake(self.exhibitionImageView.frame.origin.x+self.exhibitionImageView.frame.size.width/2-CHANGED_WIDTH_(100.0)/2, self.exhibitionImageView.frame.origin.y+self.exhibitionImageView.frame.size.height+CHANGED_HEIGH_(30.0), CHANGED_WIDTH_(100.0), CHANGED_HEIGH_(20))];
        _exhibitionShareLable.text = @"展览分享至";
        _exhibitionShareLable.textAlignment = NSTextAlignmentCenter;
        _exhibitionShareLable.textColor = [UIColor redColor];
    }
    return _exhibitionShareLable;
}

-(UIImageView *)rightSepareteImageView {
    if (!_rightSepareteImageView) {
        _rightSepareteImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.exhibitionImageView.frame.origin.x+self.exhibitionImageView.frame.size.width-CHANGED_WIDTH_(50), self.exhibitionImageView.frame.origin.y+self.exhibitionImageView.frame.size.height+CHANGED_HEIGH_(40), CHANGED_WIDTH_(50), CHANGED_HEIGH_(1))];
        _rightSepareteImageView.backgroundColor = [UIColor whiteColor];
    }
    return _rightSepareteImageView;
}

-(UIButton *)sinaShareButton {
    if (!_sinaShareButton) {
        _sinaShareButton  = [UIButton buttonWithType:UIButtonTypeSystem];
        _sinaShareButton.frame = CGRectMake(SCREEN_WIDTH/2-CHANGED_WIDTH_(32.5)-CHANGED_WIDTH_(50.0), self.exhibitionShareLable.frame.origin.y+self.exhibitionShareLable.frame.size.height+CHANGED_HEIGH_(22.0), CHANGED_WIDTH_(50.0), CHANGED_HEIGH_(50.0));
        [_sinaShareButton setBackgroundImage:[UIImage imageNamed:@"but_sina_nor"] forState:UIControlStateNormal];
    }
    return _sinaShareButton;
}

-(UIButton *)weixinShareButton {
    if (!_weixinShareButton) {
        _weixinShareButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _weixinShareButton.frame = CGRectMake(SCREEN_WIDTH/2+CHANGED_WIDTH_(32.5), self.exhibitionShareLable.frame.origin.y+self.exhibitionShareLable.frame.size.height+CHANGED_HEIGH_(22.0), CHANGED_WIDTH_(50.0), CHANGED_HEIGH_(50.0));
        [_weixinShareButton setBackgroundImage:[UIImage imageNamed:@"but_fir_nor"] forState:UIControlStateNormal];
    }
    return _weixinShareButton;
}

-(UILabel *)sinaShareLable {
    if (!_sinaShareLable) {
        _sinaShareLable = [[UILabel alloc]initWithFrame:CGRectMake(self.sinaShareButton.frame.origin.x+self.sinaShareButton.frame.size.width/2-CHANGED_WIDTH_(80.0)/2, self.sinaShareButton.frame.origin.y+self.sinaShareButton.frame.size.height+CHANGED_HEIGH_(15.0), CHANGED_WIDTH_(80.0), CHANGED_HEIGH_(20))];
        _sinaShareLable.text = @"新浪分享";
        _sinaShareLable.textColor = [UIColor whiteColor];
        _sinaShareLable.textAlignment = NSTextAlignmentCenter;
    }
    return _sinaShareLable;
}

-(UILabel *)weixinShareLable {
    if (!_weixinShareLable) {
        _weixinShareLable = [[UILabel alloc]initWithFrame:CGRectMake(self.weixinShareButton.frame.origin.x+self.weixinShareButton.frame.size.width/2-CHANGED_WIDTH_(80.0)/2, self.sinaShareLable.frame.origin.y, CHANGED_WIDTH_(80.0), CHANGED_HEIGH_(20))];
        _weixinShareLable.textAlignment = NSTextAlignmentCenter;
        _weixinShareLable.text = @"朋友圈";
        _weixinShareLable.textColor = [UIColor whiteColor];
    }
    return _weixinShareLable;
}
@end
