//
//  NSArray+Safe.m
//  HaoHaoZhu
//
//  Created by lisong on 2017/4/1.
//  Copyright © 2017年 HaoHaoZhu. All rights reserved.
//

#import "NSArray+Safe.h"

@implementation NSArray (Safe)

+ (void)load
{
    [NSClassFromString(@"__NSPlaceholderArray") swapMethod:@selector(initWithObjects:count:)
                                             currentMethod:@selector(ls_initWithObjects:count:)];
    
    [NSClassFromString(@"__NSArrayI") swapMethod:@selector(objectAtIndex:)
                                   currentMethod:@selector(ls_objectAtIndex:)];
    
    [NSClassFromString(@"__NSArray0") swapMethod:@selector(objectAtIndex:)
                                   currentMethod:@selector(ls_zeroObjectAtIndex:)];
    
    [NSClassFromString(@"__NSSingleObjectArrayI") swapMethod:@selector(objectAtIndex:)
                                               currentMethod:@selector(ls_singleObjectAtIndex:)];
}

- (instancetype)ls_initWithObjects:(id *)objects count:(NSUInteger)cnt
{
    NSUInteger newCnt = 0;
    for (NSUInteger i = 0; i < cnt; i++)
    {
        if (!objects[i])
        {
            break;
        }
        newCnt++;
    }
    
    return [self ls_initWithObjects:objects count:newCnt];
}

- (id)ls_objectAtIndex:(NSUInteger)index
{
    if (index >= [self count])
    {
        return nil;
    }
    return [self ls_objectAtIndex:index];
}

- (id)ls_zeroObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count)
    {
        return nil;
    }
    return [self ls_zeroObjectAtIndex:index];
}

- (id)ls_singleObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count)
    {
        return nil;
    }
    return [self ls_singleObjectAtIndex:index];
}

@end



@implementation NSMutableArray (Safe)

+ (void)load
{
    [NSClassFromString(@"__NSArrayM") swapMethod:@selector(objectAtIndex:)
                                   currentMethod:@selector(ls_objectAtIndex:)];
    
    [NSClassFromString(@"__NSArrayM") swapMethod:@selector(addObject:)
                                   currentMethod:@selector(ls_addObject:)];
    
    [NSClassFromString(@"__NSArrayM") swapMethod:@selector(removeObjectAtIndex:)
                                   currentMethod:@selector(ls_removeObjectAtIndex:)];
    
    [NSClassFromString(@"__NSArrayM") swapMethod:@selector(replaceObjectAtIndex:withObject:)
                                   currentMethod:@selector(ls_replaceObjectAtIndex:withObject:)];
    
    [NSClassFromString(@"__NSArrayM") swapMethod:@selector(removeObjectsInRange:)
                                   currentMethod:@selector(ls_removeObjectsInRange:)];
    
    [NSClassFromString(@"__NSArrayM") swapMethod:@selector(insertObject:atIndex:)
                                   currentMethod:@selector(ls_insertObject:atIndex:)];
}

- (id)ls_objectAtIndex:(NSUInteger)index
{
    if (index >= self.count)
    {
        return nil;
    }
    return [self ls_objectAtIndex:index];
}

- (void)ls_addObject:(id)anObject
{
    if (!anObject)
    {
        return;
    }
    [self ls_addObject:anObject];
}

- (void)ls_removeObjectAtIndex:(NSUInteger)index
{
    if (index >= [self count])
    {
        return;
    }
    
    return [self ls_removeObjectAtIndex:index];
}

- (void)ls_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (index >= [self count])
    {
        return;
    }
    
    if (!anObject)
    {
        return;
    }
    
    [self ls_replaceObjectAtIndex:index withObject:anObject];
}

- (void)ls_removeObjectsInRange:(NSRange)range
{
    if (range.location > self.count)
    {
        return;
    }
    
    if (range.length > self.count)
    {
        return;
    }
    
    if ((range.location + range.length) > self.count)
    {
        return;
    }
    
    return [self ls_removeObjectsInRange:range];
}

- (void)ls_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (index > self.count)
    {
        return;
    }
    
    if (!anObject)
    {
        return;
    }
    
    [self ls_insertObject:anObject atIndex:index];
}

@end
