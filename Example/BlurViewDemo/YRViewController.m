//
//  YRViewController.m
//  BlurViewDemo
//
//  Created by TangchangTomYang on 08/22/2017.
//  Copyright (c) 2017 TangchangTomYang. All rights reserved.
//

#import "YRViewController.h"
#import "YRblurView.h"


@interface YRViewController ()

@end

@implementation YRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    //    YRblurView *d = [[YRblurView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    YRblurView *d = [YRblurView blurView];
    //    [self.view addSubview:d];
    
    [d show];
}

@end
