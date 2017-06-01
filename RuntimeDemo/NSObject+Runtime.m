//
//  NSObject+Runtime.m
//  RuntimeDemo
//
//  Created by lisong on 2017/5/25.
//  Copyright © 2017年 lisong. All rights reserved.
//

#import "NSObject+Runtime.h"
#import <objc/runtime.h>

@implementation NSObject (Runtime)

+ (NSArray *)fetchIvarList
{
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++)
    {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:2];
        const char *ivarName = ivar_getName(ivarList[i]);
        const char *ivarType = ivar_getTypeEncoding(ivarList[i]);
        dic[@"type"] = [NSString stringWithUTF8String:ivarType];
        dic[@"ivarName"] = [NSString stringWithUTF8String:ivarName];
        
        [mutableList addObject:dic];
    }
    free(ivarList);
    return [NSArray arrayWithArray:mutableList];
}

+ (NSArray *)fetchPropertyList
{
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList(self, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++)
    {
        const char *propertyName = property_getAttributes(propertyList[i]);
        [mutableList addObject:[NSString stringWithUTF8String:propertyName]];
    }
    free(propertyList);
    return [NSArray arrayWithArray:mutableList];
}

+ (NSArray *)fetchInstanceMethodList
{
    unsigned int count = 0;
    Method *methodList = class_copyMethodList(self, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++)
    {
        Method method = methodList[i];
        SEL methodName = method_getName(method);
        [mutableList addObject:NSStringFromSelector(methodName)];
    }
    free(methodList);
    return [NSArray arrayWithArray:mutableList];
}

+ (NSArray *)fetchClassMethodList
{
    unsigned int count = 0;
    Method *methodList = class_copyMethodList(object_getClass(self), &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++)
    {
        Method method = methodList[i];
        SEL methodName = method_getName(method);
        [mutableList addObject:NSStringFromSelector(methodName)];
    }
    free(methodList);
    return [NSArray arrayWithArray:mutableList];
}

+ (NSArray *)fetchProtocolList
{
    unsigned int count = 0;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList(self, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++ )
    {
        Protocol *protocol = protocolList[i];
        const char *protocolName = protocol_getName(protocol);
        [mutableList addObject:[NSString stringWithUTF8String:protocolName]];
    }
    
    return [NSArray arrayWithArray:mutableList];
}

+ (void)addMethod:(SEL)methodSel methodImp:(SEL)methodImp;
{
    Method method = class_getInstanceMethod(self, methodImp);
    IMP methodIMP = method_getImplementation(method);
    const char *types = method_getTypeEncoding(method);
    class_addMethod(self, methodSel, methodIMP, types);
}

+ (void)swapMethod:(SEL)originMethod currentMethod:(SEL)currentMethod;
{
    Method firstMethod = class_getInstanceMethod(self, originMethod);
    Method secondMethod = class_getInstanceMethod(self, currentMethod);
    method_exchangeImplementations(firstMethod, secondMethod);
}

+ (void)swapClassMethod:(SEL)originMethod currentMethod:(SEL)currentMethod;
{
    Method firstMethod = class_getClassMethod(self, originMethod);
    Method secondMethod = class_getClassMethod(self, currentMethod);
    method_exchangeImplementations(firstMethod, secondMethod);
}

@end
