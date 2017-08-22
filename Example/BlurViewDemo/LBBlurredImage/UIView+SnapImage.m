//
//  UIView+SnapImage.m
//  EffectViewDemo
//
//  Created by 　yangrui on 2017/8/22.
//  Copyright © 2017年 Arvin. All rights reserved.
//

#import "UIView+SnapImage.h"

@implementation UIView (SnapImage)

-(UIImage *)snapShotImage{
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]){
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    } else {
        UIGraphicsBeginImageContext(self.bounds.size);
    }
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    return  UIGraphicsGetImageFromCurrentImageContext();
    
}

@end
