//
//  ViewController.m
//  proxy
//
//  Created by 董知樾 on 2018/5/17.
//  Copyright © 2018年 Yue. All rights reserved.
//

#import "ViewController.h"
#import "YYTextView.h"

@interface ViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet YYTextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _textView.layer.borderWidth = 1;
    _textView.layer.borderColor = [UIColor colorWithRed:0.8 green:0 blue:0 alpha:0.5].CGColor;
    [_textView setProxy];
}

- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"ViewController -- textViewDidChange");
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {

    NSLog(@"ViewController -- %@", text);
    return YES;
}

- (void)dealloc {
    NSLog(@"ViewController - dealloc");
}

@end
