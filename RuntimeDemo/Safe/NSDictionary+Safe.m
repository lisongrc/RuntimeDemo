//
//  NSDictionary+Safe.m
//  HaoHaoZhu
//
//  Created by lisong on 2017/4/1.
//  Copyright © 2017年 HaoHaoZhu. All rights reserved.
//

#import "NSDictionary+Safe.h"

@implementation NSDictionary (Safe)

+ (void)load
{
    [NSClassFromString(@"__NSPlaceholderDictionary") swapMethod:@selector(initWithObjects:forKeys:count:)
                                                  currentMethod:@selector(ls_initWithObjects:forKeys:count:)];
}

- (instancetype)ls_initWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt
{
    id safeObjects[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++)
    {
        id key = keys[i];
        id obj = objects[i];
        if (!key)
        {
            continue;
        }
        if (!obj)
        {
            obj = [NSNull null];
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }
    
    return [self ls_initWithObjects:safeObjects forKeys:safeKeys count:j];
}

@end


@implementation NSMutableDictionary (Safe)

+ (void)load
{
    [NSClassFromString(@"__NSDictionaryM") swapMethod:@selector(setObject:forKey:)
                                        currentMethod:@selector(ls_setObject:forKey:)];
}

- (void)ls_setObject:(id)anObject forKey:(id <NSCopying>)aKey
{
    if (!anObject)
    {
        return;
    }
    if (!aKey)
    {
        return;
    }
    [self ls_setObject:anObject forKey:aKey];
}

@end

