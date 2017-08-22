//
//  YRblurView.m
//  EffectViewDemo
//
//  Created by 　yangrui on 2017/8/22.
//  Copyright © 2017年 Arvin. All rights reserved.
//

#import "YRblurView.h"
#import "YRAdjusltLightView.h"

@interface YRblurView ()

@property(nonatomic, strong)UIImageView *blur;

@property (weak, nonatomic) IBOutlet YRAdjusltLightView *adjustLightView;

@end

@implementation YRblurView


-(UIImageView *)blur{
    if (!_blur) {
        _blur = [[UIImageView alloc]initWithFrame:self.bounds];
    }
    return _blur;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.blur];
    }
    return self;
}

+(instancetype)blurView{
    YRblurView *blurView = [[[NSBundle mainBundle] loadNibNamed:@"YRblurView" owner:nil options:nil]lastObject];
    blurView.frame = [UIScreen mainScreen].bounds;
    return blurView;
}



-(void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToWindow:newWindow];
    
    [self addTapGesture];
    
    UIImage *blurIamge = [newWindow snapShotImage];
    if (blurIamge) {
        [self.blur setImageToBlur:blurIamge blurRadius:5 completionBlock:^{ }];
        [self insertSubview:self.blur atIndex:0];
    }   
   
}



-(void)addTapGesture{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureAction:)];
    
    [self addGestureRecognizer:tapGesture];
    
}

-(void)tapGestureAction:(UITapGestureRecognizer *)tapGesture {
    
    [self removeFromSuperview];
}

-(void)show{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

-(void)setBrightness:(NSInteger)brightness{
    _brightness = brightness;
    self.adjustLightView.brightness = brightness;

}

-(void)setName:(NSString *)name{
    _name = [name copy];
    self.adjustLightView.name = name;
}

@end
