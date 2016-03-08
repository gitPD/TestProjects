//
//  ViewController.m
//  Test_NewsFramework
//
//  Created by rong on 16/1/21.
//  Copyright © 2016年 rong. All rights reserved.
//

#import "ViewController.h"
#import "WorkTest.h"

@interface ViewController ()

@property (nonatomic, strong) UITabBar *bottomTabbar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUI];

}

-(void)setUI {
    [self.view addSubview:self.bottomTabbar];
}

#pragma mark - 底部导航

-(UITabBar *)bottomTabbar {
    if (!_bottomTabbar) {
        _bottomTabbar = [[UITabBar alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-44, SCREEN_WIDTH, 44)];
        UITabBarItem *firstItem = [[UITabBarItem alloc]initWithTitle:@"firstItem" image:nil selectedImage:nil];
        UITabBarItem *secondItem = [[UITabBarItem alloc]initWithTitle:@"secondItem" image:nil selectedImage:nil];
        UITabBarItem *thirdItem = [[UITabBarItem alloc]initWithTitle:@"thirdItem" image:nil selectedImage:nil];
        UITabBarItem *fourthItem = [[UITabBarItem alloc]initWithTitle:@"fourthItem" image:nil selectedImage:nil];
        _bottomTabbar.items = [[NSArray alloc]initWithObjects:firstItem, secondItem,thirdItem,fourthItem,nil];
        _bottomTabbar.selectedItem = firstItem;
        
    }
    return _bottomTabbar;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
