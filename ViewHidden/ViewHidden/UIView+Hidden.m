//
//  UIView+Hidden.m
//  ViewHidden
//
//  Created by 王印 on 16/8/31.
//  Copyright © 2016年 王印. All rights reserved.
//

#import <objc/runtime.h>
#import "UIView+Hidden.h"
#import "NSLayoutConstraint+Hidden.h"

@implementation UIView (Hidden)

- (BOOL)blHidden
{
    return [objc_getAssociatedObject(self, @selector(blHidden)) boolValue];
}

- (void)setBlHidden:(BOOL)blHidden
{
    objc_setAssociatedObject(self, @selector(blHidden), @(blHidden), OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.hidden = blHidden;
    [self hideConstraintsForView:self];
}


- (void)hideConstraintsForView:(UIView *)view{
    
    for (NSLayoutConstraint *constraint in self.constraints) {
        
//        firstItem与secondItem分别是界面中受约束的视图与被参照的视图。
        if (constraint.oldValue==0) {
            constraint.oldValue = constraint.constant;
        }
        
        BOOL isFirstItem = [constraint.firstItem isEqual:view];
        
        BOOL isSecondItem = [constraint.secondItem isEqual:view];
        
        if (!(isFirstItem || isSecondItem)){
            
            continue;
        }

        UIView *otherItem;
        
        if (isFirstItem)//只考虑自己是被约束视图的情况
        {
            otherItem = constraint.secondItem;
        }
        
        if (otherItem==view.superview)//如果参照父视图
        {
            continue;
        }
//
        if (!otherItem) {
             constraint.collapsed = view.blHidden;
        }
    }
    
    [self.superview hideConstraintsForView:view];
    [self.superview layoutSubviews];
}
@end
