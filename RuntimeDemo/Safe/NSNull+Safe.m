//
//  NSNull+Safe.m
//  lisong
//
//  Created by lisong on 2017/4/11.
//  Copyright © 2017年 lisong. All rights reserved.
//

#import "NSNull+Safe.h"

@implementation NSNull (Safe)

+ (void)load
{
    [NSNull swapMethod:@selector(methodSignatureForSelector:)
         currentMethod:@selector(ls_methodSignatureForSelector:)];
    
    [NSNull swapMethod:@selector(forwardInvocation:)
         currentMethod:@selector(ls_forwardInvocation:)];
}

- (NSMethodSignature *)ls_methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *sig = [self ls_methodSignatureForSelector:aSelector];
    if (sig)
    {
        return sig;
    }
    return [NSMethodSignature signatureWithObjCTypes:@encode(void)];
}

- (void)ls_forwardInvocation:(NSInvocation *)anInvocation
{
    NSUInteger returnLength = [[anInvocation methodSignature] methodReturnLength];
    if (!returnLength)
    {
        return;
    }
    
    char buffer[returnLength];
    memset(buffer, 0, returnLength);
    
    [anInvocation setReturnValue:buffer];
}

@end
