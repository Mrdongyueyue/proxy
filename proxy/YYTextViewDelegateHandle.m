//
//  YYTextViewDelegateHandle.m
//  proxy
//
//  Created by 董知樾 on 2018/5/17.
//  Copyright © 2018年 Yue. All rights reserved.
//

#import "YYTextViewDelegateHandle.h"

@implementation YYTextViewDelegateHandle

- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"YYTextViewDelegateHandle -- textViewDidChange");
}

- (void)dealloc {
    NSLog(@"YYTextViewDelegateHandle - dealloc");
}


@end
