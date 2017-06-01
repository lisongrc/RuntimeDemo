//
//  NSObject+Runtime.h
//  RuntimeDemo
//
//  Created by lisong on 2017/5/25.
//  Copyright © 2017年 lisong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)

/** 获取成员变量，包括属性生成的成员变量 */
+ (NSArray *)fetchIvarList;

/** 获取类的属性列表，包括私有和公有属性，也包括分类中的属性 */
+ (NSArray *)fetchPropertyList;

/** 获取对象方法列表：包括getter, setter, 分类中的方法等 */
+ (NSArray *)fetchInstanceMethodList;

/** 获取类方法列表 包括分类里面的 */
+ (NSArray *)fetchClassMethodList;

/** 获取协议列表，包括.h .m 和分类里的 */
+ (NSArray *)fetchProtocolList;

/** 添加一个方法 */
+ (void)addMethod:(SEL)methodSel methodImp:(SEL)methodImp;

/** 实例方法交换 */
+ (void)swapMethod:(SEL)originMethod currentMethod:(SEL)currentMethod;

/** 类方法交换 */
+ (void)swapClassMethod:(SEL)originMethod currentMethod:(SEL)currentMethod;

@end
