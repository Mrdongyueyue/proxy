//
//  ViewController2.m
//  proxy
//
//  Created by 董知樾 on 2018/5/17.
//  Copyright © 2018年 Yue. All rights reserved.
//

#import "ViewController2.h"
#import "YYTextViewDelegateHandle.h"

@interface ViewController2 ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) YYTextViewDelegateHandle *textViewDelegate;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _textView.layer.borderWidth = 1;
    _textView.layer.borderColor = [UIColor colorWithRed:0.8 green:0 blue:0 alpha:0.5].CGColor;
    _textViewDelegate = [YYTextViewDelegateHandle new];
    _textView.delegate = _textViewDelegate;
    
}

- (void)dealloc {
    NSLog(@"ViewController2 - dealloc");
}

@end
