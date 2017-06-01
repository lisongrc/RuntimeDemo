//
//  TestClass+Category.m
//  RuntimeDemo
//
//  Created by lisong on 2017/6/1.
//  Copyright © 2017年 lisong. All rights reserved.
//

#import "TestClass+Category.h"
#import <objc/runtime.h>

@implementation TestClass (Category)

#pragma mark - 替换原有的方法

+ (void)load
{
    [TestClass swapClassMethod:@selector(classMethod:) currentMethod:@selector(myClassMethod:)];
    [TestClass swapMethod:@selector(publicMethod:) currentMethod:@selector(myPublicMethod:)];
}

+ (void)myClassMethod:(NSString *)param
{
    //这里调用的实际上是classMethod的实现
    [self myClassMethod:param];
    
    NSLog(@"%s",__FUNCTION__);
}

- (void)myPublicMethod:(NSString *)param
{
    //这里调用的实际上是publicMethod的实现
    [self myPublicMethod:param];
    
    NSLog(@"%s",__FUNCTION__);
}

#pragma mark - 分类中属性的getter方法和setter方法

- (NSString *)categroyProperty
{
    return objc_getAssociatedObject(self, @selector(categroyProperty));
}

- (void)setCategroyProperty:(NSString *)categroyProperty
{
    objc_setAssociatedObject(self, @selector(categroyProperty), categroyProperty, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - 分类中的类方法

- (void)categoryClassMethod
{
    
}

#pragma mark - 分类中的实例方法

- (void)categoryMethod
{
    
}

@end
