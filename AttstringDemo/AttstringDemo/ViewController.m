//
//  ViewController.m
//  AttstringDemo
//
//  Created by rong on 15/12/25.
//  Copyright © 2015年 rong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    
    //必须是mutable类型的才可以  使用addAttributes方法
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:@"asdf2d今天天气不错呀今天天气不错呀今天天气不错呀"];
    
    UILabel *attributeLable  = [[UILabel alloc]initWithFrame:CGRectMake(0, 90, 400, 200)];
    
    //阴影对象设置
    NSShadow *textShadow = [[NSShadow alloc]init];
    textShadow.shadowOffset = CGSizeMake(1, 3);                 //偏移量
    textShadow.shadowBlurRadius = 5;                            //模糊半径--模糊度
    textShadow.shadowColor = [UIColor purpleColor];             //颜色
    
    //设置段落样式
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentCenter;

    //NSStrokeColorAttributeName 要和 NSStrokeWidthAttributeName配合使用
    
    NSDictionary *attributeDic = [NSDictionary dictionaryWithObjectsAndKeys:
                                  [UIFont systemFontOfSize:18.0],NSFontAttributeName,
                                  [UIColor redColor],NSForegroundColorAttributeName,
                                  @(NSUnderlineStyleSingle),NSStrikethroughStyleAttributeName,
                                  [UIColor orangeColor],NSStrokeColorAttributeName,
                                  @(3),NSStrokeWidthAttributeName,
                                  @(NSUnderlineStyleThick),NSUnderlineStyleAttributeName,
                                  @(1),NSLigatureAttributeName,     //连字符
                                  @(10),NSKernAttributeName,        //文字间隔
                                  textShadow,NSShadowAttributeName,
                                  @(0),NSVerticalGlyphFormAttributeName,
                                  @(2),NSObliquenessAttributeName,  //文字倾斜度
                                  @(1),NSExpansionAttributeName,   //文字扁平度
                                  nil];
//    NSTextEffectAttributeName NSTextEffectLetterpressStyle
    
    [attributedStr addAttributes:attributeDic range:NSMakeRange(0, 10)];
    
    [attributedStr addAttribute:NSBackgroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(0, 8)];
    
    //注意 属性
    attributeLable.attributedText = attributedStr;
    
    [self.view addSubview:attributeLable];
    NSLog(@"test demo 123 !!!");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
