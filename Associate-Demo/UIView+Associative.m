//
//  UIView+Associative.m
//  WZLBadgeDemo
//
//  Created by RenSihao on 16/2/22.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "UIView+Associative.h"
#import <objc/runtime.h>

@implementation UIView (Associative)

//重写get方法
- (CGFloat)xxxValue
{
    id obj = objc_getAssociatedObject(self, &xxxKey);
    if (obj != nil && [obj isKindOfClass:[NSNumber class]])
    {
        return [obj floatValue];
    }
    else
        return 0.0;
}
//重写set方法
- (void)setXxxValue:(CGFloat)xxxValue
{
    NSDictionary *xxxValueInfo = @{@"value":[NSString stringWithFormat:@"%lf", xxxValue]};
    objc_setAssociatedObject(self, &xxxKey, xxxValueInfo, OBJC_ASSOCIATION_RETAIN);
    self.xxxValue = xxxValue;
}

@end
