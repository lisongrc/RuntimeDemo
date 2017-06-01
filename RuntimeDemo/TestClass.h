//
//  TestClass.h
//  RuntimeDemo
//
//  Created by lisong on 2017/6/1.
//  Copyright © 2017年 lisong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestClass : NSObject<UIWebViewDelegate>

@property (nonatomic, copy) NSString *publicProperty;

+ (void)classMethod:(NSString *)param;

- (void)publicMethod:(NSString *)param;

@end
