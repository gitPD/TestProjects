//
//  ViewController.m
//  Test_DocumentAttributeDemo
//
//  Created by rong on 15/12/28.
//  Copyright © 2015年 rong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:@"今天是个好 天 气,爱迪生法大时代阿文发生的"];
    
    UILabel *attributeLable  = [[UILabel alloc]initWithFrame:CGRectMake(0, 90, 400, 200)];
    attributeLable.attributedText = attString;
    [self.view addSubview:attributeLable];
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSCharacterSet *charaSet = [NSCharacterSet characterSetWithCharactersInString:@" "];
    NSCharacterSet *perSet = [NSCharacterSet characterSetWithCharactersInString:@""];

    NSTextTab *textTab = [[NSTextTab alloc]initWithTextAlignment:NSTextAlignmentCenter location:3 options:@{NSTabColumnTerminatorsAttributeName:charaSet}];
    
    NSTextTab *perTeb = [[NSTextTab alloc]initWithTextAlignment:NSTextAlignmentRight location:5 options:@{NSTabColumnTerminatorsAttributeName:perSet}];
    paragraph.tabStops = @[textTab,perTeb];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
