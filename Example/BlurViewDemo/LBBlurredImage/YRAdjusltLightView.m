//
//  YRAdjusltLightView.m
//  EffectViewDemo
//
//  Created by 　yangrui on 2017/8/22.
//  Copyright © 2017年 Arvin. All rights reserved.
//

#import "YRAdjusltLightView.h"
@interface YRAdjusltLightView()
@property(nonatomic, strong)CALayer *percentLayer;


@property (weak, nonatomic) IBOutlet UILabel *brightnessLb;
@property (weak, nonatomic) IBOutlet UILabel *nameLb;
@property (weak, nonatomic) IBOutlet UIImageView *iconV;


@end
@implementation YRAdjusltLightView

-(CALayer *)percentLayer{
    if (!_percentLayer) {
        _percentLayer = [CALayer layer];
        _percentLayer.frame = self.bounds;
        _percentLayer.backgroundColor = [UIColor colorWithRed:1 green:228/255.0 blue:122/255.0 alpha:1].CGColor; //255;228,122
    }
    return _percentLayer;
}


-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self.layer addSublayer:self.percentLayer];
    [self.layer insertSublayer:self.percentLayer atIndex:0];
    
    self.layer.cornerRadius = 10.0;
    self.layer.masksToBounds = YES;
    
    [self addTapGesture];
    [self addPanGesture];
    
}
-(void)addPanGesture{
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureAction:)];
    
    [self addGestureRecognizer:panGesture];
    
}

-(void)panGestureAction:(UIPanGestureRecognizer *)panGesture{
    UIGestureRecognizerState state = panGesture.state;
    
    if (state == UIGestureRecognizerStateBegan) {
        
        [self updateBrightNess2Point:[panGesture locationInView:self] animation:YES];
    }
    else if (state == UIGestureRecognizerStateChanged) {
         [self updateBrightNess2Point:[panGesture locationInView:self] animation:NO];
    }
    else if (state == UIGestureRecognizerStateCancelled ||
              state == UIGestureRecognizerStateEnded ||
              state == UIGestureRecognizerStateFailed) {
        
        [self updateBrightNess2Point:[panGesture locationInView:self] animation:NO];
    }

 
    
}


-(void)addTapGesture{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureAction:)];
    
    [self addGestureRecognizer:tapGesture];
    
}

-(void)tapGestureAction:(UITapGestureRecognizer *)tapGesture {


    [self updateBrightNess2Point:[tapGesture locationInView:self] animation:YES];
}


-(void)updateBrightNess2Point:(CGPoint)point animation:(BOOL)animation{
    CGFloat selfHeight = self.bounds.size.height;

    CGFloat pointY = point.y;
    
    if (pointY < 0.01 * selfHeight) {
        pointY = 0;
    }
    if (pointY > selfHeight *0.99) {
        pointY = selfHeight;
    }
    
   
    self.brightness = ((selfHeight - pointY)/selfHeight * 100);
    
    
    if (animation == YES) {
        
        self.percentLayer.frame = CGRectMake(0, pointY, self.bounds.size.width, selfHeight - pointY );
    
    }else{
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        self.percentLayer.frame = CGRectMake(0, pointY, self.bounds.size.width, selfHeight - pointY );
        [CATransaction commit];
    }

}


-(void)setBrightness:(CGFloat)brightness{
    _brightness = brightness;
    self.brightnessLb.text = [NSString stringWithFormat:@"%02.0f%%",brightness];
}

-(void)setName:(NSString *)name{
    _name = [name copy];
    self.nameLb.text = name;
}

@end
