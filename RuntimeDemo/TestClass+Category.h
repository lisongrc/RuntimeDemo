//
//  TestClass+Category.h
//  RuntimeDemo
//
//  Created by lisong on 2017/6/1.
//  Copyright © 2017年 lisong. All rights reserved.
//

#import "TestClass.h"

@interface TestClass (Category)

@property (nonatomic, copy) NSString *categroyProperty;

- (void)categoryClassMethod;

- (void)categoryMethod;

@end
