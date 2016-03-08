//
//  ViewController.m
//  RC_TextKit
//
//  Created by rong on 16/2/22.
//  Copyright © 2016年 rc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (nonatomic, strong) NSTextContainer *textContainer;

//@property (nonatomic, strong) UITextView *textView;

@property (strong, nonatomic) IBOutlet UITextView *textView;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    CGRect textViewRect = CGRectInset(self.view.bounds, 10.0, 20.0);                   
//    
//    NSTextStorage* textStorage = [[NSTextStorage alloc] initWithString:_textView.text];
//    
//    NSLayoutManager* layoutManager = [[NSLayoutManager alloc] init];
//    
//    [textStorage addLayoutManager:layoutManager];
//    _textContainer = [[NSTextContainer alloc] initWithSize:textViewRect.size];
//    [layoutManager addTextContainer:_textContainer];
//    
//    [_textView removeFromSuperview];
//    _textView = [[UITextView alloc] initWithFrame:textViewRect
//                                    textContainer:_textContainer];
//    
//    [self.view addSubview:_textView];
//    
//    //设置凸版印刷效果
//    [textStorage beginEditing];
//    NSDictionary *attrsDic = @{NSTextEffectAttributeName: NSTextEffectLetterpressStyle};
//    
//    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]
//                                          initWithString:_textView.text attributes:attrsDic];
//    
//    [textStorage setAttributedString:attrStr];
//    
//    [self markWord:@"我" inTextStorage:textStorage];
//    [self markWord:@"I" inTextStorage:textStorage];
//    
//    [textStorage endEditing];
    
    /*****************************凸版印刷效果**********************************/
    /*
    CGRect textViewRect = CGRectInset(self.view.bounds, 10.0, 20.0);
    
    NSTextStorage *textSotrage = [[NSTextStorage alloc]initWithString:self.textView.text];
    
    NSLayoutManager *textManager = [[NSLayoutManager alloc]init];
    
    [textSotrage addLayoutManager:textManager];
    
    _textContainer = [[NSTextContainer alloc]initWithSize:textViewRect.size];
    
    [textManager addTextContainer:_textContainer];
    
    [_textView removeFromSuperview];
    
    _textView = [[UITextView alloc]initWithFrame:textViewRect textContainer:_textContainer];
    
    [self.view addSubview:_textView];
    
    [textSotrage beginEditing];
    
    NSDictionary *attrDic = @{NSTextEffectAttributeName:NSTextEffectLetterpressStyle};
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:_textView.text attributes:attrDic];
    
    [textSotrage setAttributedString:attrString];
    
    [self markWord:@"s" inTextStorage:textSotrage];
    
    [textSotrage endEditing];
    
    */
    
    /*************************文字图文混合排版*************************************/
    /*
    CGRect textViewRect = CGRectInset(self.view.bounds, 10.0, 20.0);
    
    NSTextStorage *textSotrage = [[NSTextStorage alloc]initWithString:self.textView.text];
    
    NSLayoutManager *textManager = [[NSLayoutManager alloc]init];
    
    [textSotrage addLayoutManager:textManager];
    
    _textContainer = [[NSTextContainer alloc]initWithSize:textViewRect.size];
    
    [textManager addTextContainer:_textContainer];
    
    [_textView removeFromSuperview];
    
    _textView = [[UITextView alloc]initWithFrame:textViewRect textContainer:_textContainer];
    
    [self.view insertSubview:_textView belowSubview:_imageView];
    
    
    //设置凸版效果
    [textSotrage beginEditing];
    
    NSDictionary *attrDic = @{NSTextEffectAttributeName:NSTextEffectLetterpressStyle};
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:_textView.text attributes:attrDic];
    
    [textSotrage setAttributedString:attrString];
    
    [textSotrage endEditing];
    
    //设置环绕
    _textView.textContainer.exclusionPaths = @[[self translateBezierPath]];
    */
    
    /**************************动态字体******************************************/
    
    CGRect textViewRect = CGRectInset(self.view.bounds, 10.0, 20.0);
    
    NSTextStorage *textSotrage = [[NSTextStorage alloc]initWithString:self.textView.text];

    NSLayoutManager *textManager = [[NSLayoutManager alloc]init];
//    textManager.hyphenationFactor = 0.6;           //设置后启用断字
    [textSotrage addLayoutManager:textManager];
    
    _textContainer = [[NSTextContainer alloc]initWithSize:textViewRect.size];

    [textManager addTextContainer:_textContainer];
    
    [_textView removeFromSuperview];
    
    _textView = [[UITextView alloc]initWithFrame:textViewRect textContainer:_textContainer];
    
    [self.view addSubview:_textView];
    
    [textSotrage beginEditing];
    
    NSDictionary *attrDic = @{NSTextEffectAttributeName:NSTextEffectLetterpressStyle};
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:_textView.text attributes:attrDic];
    
    [textSotrage setAttributedString:attrString];
    
    [self markWord:@"s" inTextStorage:textSotrage];
    
    [textSotrage endEditing];

    //设置动态字体
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preferredContentSizeChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];

    [UIBezierPath bezierPathWithOvalInRect:<#(CGRect)#>]
}


#pragma mark 设置动态字体
-(void)preferredContentSizeChanged:(NSNotification *)notification {
    
    self.textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    
}

#pragma mark 设置环绕路径

- (UIBezierPath *)translateBezierPath {
    
    CGRect imageRect = [self.textView convertRect:_imageView.frame fromView:self.view];
    UIBezierPath *newpath = [UIBezierPath bezierPathWithRect:imageRect];
    return newpath;
}

#pragma mark 显示红色字体

- (void) markWord:(NSString*)word inTextStorage:(NSTextStorage*)textStorage
{
    
    NSRegularExpression *regex = [NSRegularExpression
                                  regularExpressionWithPattern:word
                                  options:0 error:nil];
    
    NSArray *matches = [regex matchesInString:_textView.text
                                      options:0
                                        range:NSMakeRange(0, [_textView.text length])];
    
    for (NSTextCheckingResult *match in matches) {
        NSRange matchRange = [match range];
        [textStorage addAttribute:NSForegroundColorAttributeName
                            value:[UIColor redColor]
                            range:matchRange];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
