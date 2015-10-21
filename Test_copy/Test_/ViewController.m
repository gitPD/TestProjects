//
//  ViewController.m
//  Test_
//
//  Created by rong on 15/8/21.
//  Copyright (c) 2015年 rong. All rights reserved.
//

#import "ViewController.h"
#import "SecondController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton * jumpToSecondController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUI {
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.jumpToSecondController];
}

#pragma mark - setter and getter

-(UIButton *)jumpToSecondController {
    if (!_jumpToSecondController) {
        _jumpToSecondController = [UIButton buttonWithType:UIButtonTypeSystem];
        _jumpToSecondController.frame = CGRectMake(200, 300, 120, 80);
        [_jumpToSecondController setTitle:@"跳转" forState:UIControlStateNormal];
        [_jumpToSecondController setTintColor:[UIColor blueColor]];
        [_jumpToSecondController addTarget:self action:@selector(pushUITestController) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jumpToSecondController;
}

#pragma mark - event

-(void)pushUITestController {
    SecondController *second = [[SecondController alloc]init];
    [self.navigationController pushViewController:second animated:YES];
    
}

@end
