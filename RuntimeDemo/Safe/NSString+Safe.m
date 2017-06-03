//
//  NSString+Safe.m
//  lisong
//
//  Created by lisong on 2017/4/1.
//  Copyright © 2017年 lisong. All rights reserved.
//

#import "NSString+Safe.h"

@implementation NSString (Safe)

+ (void)load
{
    [NSClassFromString(@"__NSCFConstantString") swapMethod:@selector(substringFromIndex:)
                                             currentMethod:@selector(lsConstant_substringFromIndex:)];
    
    [NSClassFromString(@"NSTaggedPointerString") swapMethod:@selector(substringFromIndex:)
                                              currentMethod:@selector(lsPoint_substringFromIndex:)];
    
    [NSClassFromString(@"__NSCFConstantString") swapMethod:@selector(substringToIndex:)
                                             currentMethod:@selector(lsConstant_substringToIndex:)];
    
    [NSClassFromString(@"NSTaggedPointerString") swapMethod:@selector(substringToIndex:)
                                              currentMethod:@selector(lsPoint_substringToIndex:)];
    
    [NSClassFromString(@"__NSCFConstantString") swapMethod:@selector(substringWithRange:)
                                             currentMethod:@selector(lsConstant_substringWithRange:)];
    
    [NSClassFromString(@"NSTaggedPointerString") swapMethod:@selector(substringWithRange:)
                                              currentMethod:@selector(lsPoint_substringWithRange:)];
}

- (NSString *)lsConstant_substringFromIndex:(NSUInteger)from
{
    if (from > self.length )
    {
        return nil;
    }
    return [self lsConstant_substringFromIndex:from];
}

- (NSString *)lsPoint_substringFromIndex:(NSUInteger)from
{
    if (from > self.length )
    {
        return nil;
    }
    return [self lsPoint_substringFromIndex:from];
}

- (NSString *)lsConstant_substringToIndex:(NSUInteger)to
{
    if (to > self.length )
    {
        return nil;
    }
    return [self lsConstant_substringToIndex:to];
}

- (NSString *)lsPoint_substringToIndex:(NSUInteger)to
{
    if (to > self.length )
    {
        return nil;
    }
    return [self lsPoint_substringToIndex:to];
}

- (NSString *)lsConstant_substringWithRange:(NSRange)range
{
    if (range.location > self.length)
    {
        return nil;
    }
    
    if (range.length > self.length)
    {
        return nil;
    }
    
    if ((range.location + range.length) > self.length)
    {
        return nil;
    }
    return [self lsConstant_substringWithRange:range];
}

- (NSString *)lsPoint_substringWithRange:(NSRange)range
{
    if (range.location > self.length)
    {
        return nil;
    }
    
    if (range.length > self.length)
    {
        return nil;
    }
    
    if ((range.location + range.length) > self.length)
    {
        return nil;
    }
    return [self lsPoint_substringWithRange:range];
}

@end



@implementation NSMutableString (Safe)

+ (void)load
{
    [NSClassFromString(@"__NSCFString") swapMethod:@selector(substringFromIndex:)
                                     currentMethod:@selector(ls_substringFromIndex:)];
    
    [NSClassFromString(@"__NSCFString") swapMethod:@selector(substringToIndex:)
                                     currentMethod:@selector(ls_substringToIndex:)];
    
    [NSClassFromString(@"__NSCFString") swapMethod:@selector(substringWithRange:)
                                     currentMethod:@selector(ls_substringWithRange:)];
}

- (NSString *)ls_substringFromIndex:(NSUInteger)from
{
    if (from > self.length )
    {
        return nil;
    }
    return [self ls_substringFromIndex:from];
}

- (NSString *)ls_substringToIndex:(NSUInteger)to
{
    if (to > self.length )
    {
        return nil;
    }
    return [self ls_substringToIndex:to];
}

- (NSString *)ls_substringWithRange:(NSRange)range
{
    if (range.location > self.length)
    {
        return nil;
    }
    
    if (range.length > self.length)
    {
        return nil;
    }
    
    if ((range.location + range.length) > self.length)
    {
        return nil;
    }
    return [self ls_substringWithRange:range];
}

@end
