//
//  YYTextView.m
//  proxy
//
//  Created by 董知樾 on 2018/5/17.
//  Copyright © 2018年 Yue. All rights reserved.
//

#import "YYTextView.h"


@implementation YYProxy

+ (instancetype)proxyWithObj:(id)obj {
    YYProxy *proxy = [YYProxy alloc];
    proxy.obj = obj;
    return proxy;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    
    if ([self.obj respondsToSelector:invocation.selector]) {
        [invocation invokeWithTarget:self.obj];
    }
    if ([self.proxy respondsToSelector:invocation.selector]) {
        [invocation invokeWithTarget:self.proxy];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    id result = [self.obj methodSignatureForSelector:sel];
    if (!result) {
        result = [self.proxy methodSignatureForSelector:sel];
    }
    
    return result;
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return ([self.obj respondsToSelector:aSelector]
            || [self.proxy respondsToSelector:aSelector]);
}

- (void)dealloc {
    NSLog(@"YYProxy - dealloc");
}


@end

@implementation YYTextViewService

- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"YYTextView -- textViewDidChange");
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    NSLog(@"YYTextView -- %@ %@", text, NSStringFromRange(range));
    return NO;
}

- (void)dealloc {
    NSLog(@"YYTextViewService - dealloc");
}


@end


@implementation YYTextView {
    YYProxy *_proxyDelegate;
}

- (void)setProxy {
    _proxyDelegate = [YYProxy proxyWithObj:[[YYTextViewService alloc] init]];
    if (self.delegate) {
        _proxyDelegate.proxy = self.delegate;
        self.delegate = (id <UITextViewDelegate>)_proxyDelegate;
    }
}

- (void)dealloc {
    NSLog(@"YYTextView - dealloc");
}

@end
