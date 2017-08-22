//
//  YRblurView.h
//  EffectViewDemo
//
//  Created by 　yangrui on 2017/8/22.
//  Copyright © 2017年 Arvin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SnapImage.h"
#import "UIImageView+LBBlurredImage.h"

@interface YRblurView : UIView


@property(nonatomic, assign)NSInteger brightness;
@property(nonatomic, strong)NSString *name;

+(instancetype)blurView;
-(void)show;
@end
