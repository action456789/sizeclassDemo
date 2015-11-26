//
//  ViewController.m
//  test
//
//  Created by KeSen on 15/11/25.
//  Copyright © 2015年 KeSen. All rights reserved.
//

//表示 iphone 手机所有机型竖屏
#define isIphonePortrait(newCollection) ((newCollection).horizontalSizeClass == UIUserInterfaceSizeClassCompact && (newCollection).verticalSizeClass == UIUserInterfaceSizeClassRegular)

//表示 iphone手机所有机型横屏  除了iphone6 plus
#define isIphoneLandscape(newCollection) ((newCollection).verticalSizeClass == UIUserInterfaceSizeClassCompact && (newCollection).horizontalSizeClass == UIUserInterfaceSizeClassCompact)

//表示 iphone6 plus的横屏状态
#define isIphone6PlusLandscape(newCollection) ((newCollection).verticalSizeClass == UIUserInterfaceSizeClassCompact && (newCollection).horizontalSizeClass == UIUserInterfaceSizeClassRegular)

//表示 Ipad 的横竖屏状态
#define isIpad(newCollection) ((newCollection).verticalSizeClass == UIUserInterfaceSizeClassRegular && (newCollection).horizontalSizeClass == UIUserInterfaceSizeClassRegular)


#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _btn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [self.view addSubview:_btn];
    
    _redView = [[UIView alloc] init];
    _redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_redView];
    
    //获取设备的SizeClasses信息
    UITraitCollection *newCollection =  self.traitCollection;
    
    //判断设备的SizeClasses
    if (isIphonePortrait(self.traitCollection)) {
        NSLog(@"iphone 竖屏");

        [_btn setTitle:@"出现在IPhone" forState:UIControlStateNormal];
        
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self.view);
        }];
        
        [_redView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(self.view.mas_bottom);
            make.width.equalTo(@100);
            make.height.equalTo(@50);
        }];
    } else if(isIpad(self.traitCollection)){
        
        NSLog(@"ipad");
        
        //ipad布局设定
        [_btn setTitle:@"出现在IPhone" forState:UIControlStateNormal];
        
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self.view);
        }];
        
        [_redView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.view.mas_top);
            make.width.equalTo(@100);
            make.height.equalTo(@50);
        }];
    } else if (isIphoneLandscape(self.traitCollection)){

        //横屏时启动时的布局设定
        NSLog(@"iphone 横屏");
    }else if (isIphoneLandscape(self.traitCollection)){

        //横屏时启动时的布局设定
        NSLog(@"iphone 6 plus 横屏");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// trait 变化时会调用
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    
}

// trait 变化时会调用
-(void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super willTransitionToTraitCollection:newCollection
                 withTransitionCoordinator:coordinator];
    [coordinator animateAlongsideTransition:^(id <UIViewControllerTransitionCoordinatorContext> context)
     {
         if (isIphonePortrait(self.traitCollection)) {
             
             //写布局内容的改变 无改变就不用写
             
             NSLog(@"iphone 竖屏");

         }else if(isIpad(self.traitCollection)){
             
             //写布局内容的改变 无改变就不用写
             NSLog(@"ipad");
             
         }else if (isIphoneLandscape(self.traitCollection)){
             
             //写布局内容的改变 无改变就不用写
             NSLog(@"iphone 横屏");
             
         }else if (isIphone6PlusLandscape(self.traitCollection)){
             
             //写布局内容的改变 无改变就不用写
             NSLog(@"iphone 6 plus 横屏");
             
         }  

         [self.view setNeedsLayout];
     } completion:nil];
}

@end
