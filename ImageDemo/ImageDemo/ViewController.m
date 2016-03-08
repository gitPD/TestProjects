//
//  ViewController.m
//  ImageDemo
//
//  Created by rong on 15/11/11.
//  Copyright © 2015年 rong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *avatarImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://pic14.nipic.com/20110522/7411759_164157418126_2.jpg"]]];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//            [_avatarImage setImage:image];
//        });
//    });

    self.avatarImage = [[UIImageView alloc]initWithFrame:CGRectMake(130, 120, 160, 80)];
    
//    self.avatarImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://pic14.nipic.com/20110522/7411759_164157418126_2.jpg"]]];
//    self.avatarImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://pic14.nipic.com/20110522/7411759_164157418126_2.jpg"]]];
   
    [self.view addSubview:self.avatarImage];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
