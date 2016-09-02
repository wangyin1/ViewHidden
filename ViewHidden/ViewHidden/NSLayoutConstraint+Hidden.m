//
//  NSLayoutConstraint+Hidden.m
//  ViewHidden
//
//  Created by 王印 on 16/8/31.
//  Copyright © 2016年 王印. All rights reserved.
//

#import  <objc/runtime.h>
#import "NSLayoutConstraint+Hidden.h"

@implementation NSLayoutConstraint (Hidden)

- (CGFloat)oldValue{
    
    CGFloat value  = [objc_getAssociatedObject(self, @selector(oldValue)) floatValue];
    return value;
}




- (void)setOldValue:(CGFloat)oldValue{
    objc_setAssociatedObject(self, @selector(oldValue), @(oldValue), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)collapsed{
    return  [objc_getAssociatedObject(self, @selector(collapsed)) boolValue];
}


- (void)setCollapsed:(BOOL)collapsed {
     objc_setAssociatedObject(self, @selector(collapsed), @(collapsed), OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.constant = collapsed ? 0 : self.oldValue;
}


@end
