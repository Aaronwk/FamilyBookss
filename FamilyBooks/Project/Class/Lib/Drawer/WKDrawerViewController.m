//
//  WKDrawerViewController.m
//  抽屉demo
//
//  Created by 王凯 on 16/3/1.
//  Copyright © 2016年 王凯. All rights reserved.
//

#define SCREENWIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREENHEIGHT [[UIScreen mainScreen] bounds].size.height
#define MAXYOFFSET 0
#define ENDRIGHTX 300
#define ENDLEFTX 300

#import "WKDrawerViewController.h"

@interface WKDrawerViewController ()
{
    UIView* redView;
    UIView* greenView;
    UIView* blueView;
    UIButton *button;
}
@end

@implementation WKDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector (change:) name:@"changeMainView" object:nil];
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector (backMainviews:) name:@"backMainView" object:nil];
    
}
- (void)setLeftView:(UIView *)leftView
{
    if(_leftView != leftView){
        greenView = leftView;
    }
}
- (void)setRightView:(UIView *)rightView
{
    if(_rightView != rightView){
        redView = rightView;
    }
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{    UITouch *touch = [touches anyObject];
    //获得当前点
    CGPoint currentPoint = [touch locationInView:redView];
    //获得起点
    CGPoint prePoint = [touch previousLocationInView:redView];
    NSLog(@"当前点：%f", currentPoint.x);
    NSLog(@"起点：%f", prePoint.x);
    //计算在x轴方向上的偏移量
    CGFloat moveX = currentPoint.x - prePoint.x;
    //然后通过在x轴上的偏移量，计算redView的frame.
    if(redView.frame.origin.x == 0 && currentPoint.x<prePoint.x){
        
    }else{
        redView.frame = [self framWithOffsetX:moveX];
    }
    
    
}

- (CGRect)framWithOffsetX:(CGFloat)offsetX
{
    if(redView.frame.origin.x >=0){
        //计算在y轴方向上的偏移量
        CGFloat ffsetY = offsetX/SCREENWIDTH * MAXYOFFSET;
        //根据y方向的偏移量计算缩放比例
        CGFloat scale = (SCREENHEIGHT - 2*ffsetY)/SCREENHEIGHT;
        //如果x < 0表示左滑
        if (redView.frame.origin.x < 0) {
            scale = (SCREENHEIGHT + 2*ffsetY)/SCREENHEIGHT;
        }
        CGRect frame = redView.frame;
        //计算滑动之后的frame.
        CGFloat height = frame.size.height*scale;
        CGFloat width  = frame.size.width;
        CGFloat x = frame.origin.x + offsetX;
        CGFloat y = (SCREENHEIGHT- height)* 0.5;
        return CGRectMake(x, y, width, height);
    }
    return CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    CGFloat xPos = redView.frame.origin.x;
    //大于屏幕的一半进入新的位置
    if (xPos > SCREENWIDTH*0.5) {
        [UIView animateWithDuration:0.5 animations:^{
            redView.frame = [self framWithBigThanX:ENDRIGHTX];
            button = [[UIButton alloc] initWithFrame:redView.bounds];
            [button addTarget:self action:@selector(backMAX) forControlEvents:UIControlEventTouchUpInside];
            [redView addSubview:button];
        }];
        return ;
    }
    //小于屏幕的一半，大于屏幕负一半的时候，则恢复到初始状态
    if (xPos < SCREENWIDTH*0.5 && xPos > -SCREENWIDTH*0.5) {
        [UIView animateWithDuration:0.5 animations:^{
            redView.frame = [UIScreen mainScreen].bounds;
        }];
        return ;
    }
    //xPos < -SCREENWIDTH*0.5的时候，进入新的位置
    [UIView animateWithDuration:0.5 animations:^{
        redView.frame =[self framWithSmallThanX:ENDLEFTX];
    }];
}
- (CGRect)framWithBigThanX:(CGFloat)offsetX{
    CGFloat ffsetY = offsetX/SCREENWIDTH * MAXYOFFSET;
    CGFloat scale = (SCREENHEIGHT - 2*ffsetY)/SCREENHEIGHT;
    CGFloat height = SCREENHEIGHT*scale;
    CGFloat width  = SCREENWIDTH;
    CGFloat x = offsetX;
    CGFloat y = (SCREENHEIGHT- height)* 0.5;
    return CGRectMake(x, y, width, height);
}
- (CGRect)framWithSmallThanX:(CGFloat)offsetX{
    CGFloat ffsetY = offsetX/SCREENWIDTH * MAXYOFFSET;
    CGFloat scale = (SCREENHEIGHT + 2*ffsetY)/SCREENHEIGHT;
    CGFloat height = SCREENHEIGHT*scale;
    CGFloat width  = SCREENWIDTH;
    CGFloat x = offsetX;
    CGFloat y = (SCREENHEIGHT- height)* 0.5;
    return CGRectMake(x, y, width, height);
}

- (void)backMAX
{
    [UIView animateWithDuration:0.5 animations:^{
        redView.frame = [UIScreen mainScreen].bounds;
        [button removeFromSuperview];
    }];
}

- (void)backMainView
{
    [UIView animateWithDuration:0.5 animations:^{
        redView.frame = [UIScreen mainScreen].bounds;
        [button removeFromSuperview];
    }];
}
- (void)changeMainView
{
    [UIView animateWithDuration:0.5 animations:^{
        redView.frame = [self framWithBigThanX:ENDRIGHTX];
    }];
}

//接收通知要做的方法
- (void)change:(NSNotification *)notification{
    [self changeMainView];
    redView.frame = [self framWithBigThanX:ENDRIGHTX];
    button = [[UIButton alloc] initWithFrame:redView.bounds];
    [button addTarget:self action:@selector(backMAX) forControlEvents:UIControlEventTouchUpInside];
    [redView addSubview:button];
    
}
//接受通知
- (void)backMainviews:(NSNotification *)notification
{
    [self backMAX];
    
    NSLog(@"%@", [notification.userInfo objectForKey:@"indexPath"]);
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SwitchView"object:self userInfo:notification.userInfo];
}

@end
