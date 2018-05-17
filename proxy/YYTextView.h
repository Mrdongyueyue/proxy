//
//  YYTextView.h
//  proxy
//
//  Created by 董知樾 on 2018/5/17.
//  Copyright © 2018年 Yue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYProxy : NSProxy

@property (weak, nonatomic) id proxy;
@property (strong, nonatomic) id obj;

+ (instancetype)proxyWithObj:(id)obj;

@end

@interface YYTextViewService : NSObject<UITextViewDelegate>

@end

@interface YYTextView : UITextView
- (void)setProxy;
@end
