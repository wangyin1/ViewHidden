//
//  NSLayoutConstraint+Hidden.h
//  ViewHidden
//
//  Created by 王印 on 16/8/31.
//  Copyright © 2016年 王印. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (Hidden)

@property(nonatomic,assign)CGFloat      oldValue;

@property(nonatomic,assign)BOOL         collapsed;//是否有效
@end
