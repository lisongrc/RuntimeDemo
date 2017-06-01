//
//  main.m
//  RuntimeDemo
//
//  Created by lisong on 2017/4/11.
//  Copyright © 2017年 lisong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestClass.h"
#import "TestClass+Category.h"

int main(int argc, char * argv[])
{
    @autoreleasepool
    {
        NSLog(@"TestClass的成员变量列表:\n%@", [TestClass fetchIvarList]);
        
        NSLog(@"TestClass的属性列表:\n%@", [TestClass fetchPropertyList]);
        
        NSLog(@"TestClass的实例方法列表:\n%@", [TestClass fetchInstanceMethodList]);
        
        NSLog(@"TestClass的类方法列表:\n%@", [TestClass fetchClassMethodList]);
        
        NSLog(@"TestClass的协议列表:\n%@", [TestClass fetchProtocolList]);
        
        // 测试执行被替换方法
        TestClass *instance = [[TestClass alloc] init];
        [instance publicMethod:@"aaa"];
        [TestClass classMethod:@"aaa"];

        // 测试找不到方法时会执行我们添加的方法
        id obj = [[TestClass alloc] init];
        [obj length];
        [obj objectAtIndex:2];
        
        
        
        // 测试一些常见崩溃被处理
        NSString *string = nil;

        NSArray *array = @[string];
        NSLog(@"%@",array[2]);
        [array objectAtIndex:2];
        
        NSDictionary *dic = @{@"key1":@"value",@"key2":string};
        NSLog(@"%@",dic);
        
        NSMutableArray *mutArray = [NSMutableArray array];
        [mutArray objectAtIndex:3];
        [mutArray addObject:string];
        [mutArray insertObject:@"ddd" atIndex:5];
        [mutArray removeObjectAtIndex:10];
        
        NSMutableDictionary *mutDic = [NSMutableDictionary dictionary];
        [mutDic setObject:string forKey:@"aaa"];
        
        NSString *str = @"string";
        
        [str substringToIndex:100];
        [str substringWithRange:NSMakeRange(0, 100)];
    }
}
