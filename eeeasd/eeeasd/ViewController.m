//
//  ViewController.m
//  eeeasd
//
//  Created by rong on 15/12/3.
//  Copyright © 2015年 rong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame = CGRectMake(120, 200, 100, 60);
    btn1.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame = CGRectMake(120, 280, 100, 60);
    btn2.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn2];
    
    UIImageView *backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, 30, 30)];
    backImage.backgroundColor = [UIColor orangeColor];
    [btn1 addSubview:backImage];
    [btn2 addSubview:backImage];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
