//
//  Home01_createUserNameView.m
//  FamilyBooks
//
//  Created by 王凯 on 16/2/29.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import "Home01_createUserNameView.h"
#import "HeaderForGlobal.h"


@implementation Home01_createUserNameView

{
    UILabel *nameLabel;
    UITextField *nameTF;
    
    
    UILabel *phoneLabel;
    UITextField *phoneTF;
    
    UIButton *btn;
    
    
    
    CGFloat x;
    CGFloat y;
    CGFloat width;
    CGFloat height;
    
    UIView *view;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.195];
        [self createSubviews];
        [self registKeyNotification];
        
    }
    return self;
}

- (void)createSubviews
{

    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250*K_WIDTH/320, 270*K_WIDTH/320)];
    view.center = self.center;
    view.backgroundColor = [UIColor whiteColor];
    view.layer.cornerRadius = 15;
    view.layer.masksToBounds = YES;
    [self addSubview:view];
    
    x = view.frame.origin.x;
    y = view.frame.origin.y;
    width = view.frame.size.width;
    height = view.frame.size.height;
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(view.frame.size.width/2-50, 30, 100, 100)];
    
    //创建UIImageView，添加到界面
    [view addSubview:imageView];
    //创建一个数组，数组中按顺序添加要播放的图片（图片为静态的图片）
    NSMutableArray *imgArray = [NSMutableArray array];
    for (int i=1; i<23; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.tiff",i]];
        [imgArray addObject:image];
    }
    //把存有UIImage的数组赋给动画图片数组
    imageView.animationImages = imgArray;
    //设置执行一次完整动画的时长
    imageView.animationDuration = 6*0.15;
    //动画重复次数 （0为重复播放）
    imageView.animationRepeatCount = 0;
    //开始播放动画
    [imageView startAnimating];
    //停止播放动画  - (void)stopAnimating;
    //判断是否正在执行动画  - (BOOL)isAnimating;
    
    
    
    nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 150, width - 40, 30)];
    nameLabel.text = @"主人儿，给自己起个名字吧~";
    nameLabel.font = [UIFont systemFontOfSize:13*K_WIDTH/320];
    nameLabel.textColor = [UIColor orangeColor];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:nameLabel];
    
    
    nameTF = [[UITextField alloc] initWithFrame:CGRectMake(40, nameLabel.bottom+10, width-80, 40)];
    nameTF.placeholder = @"想叫什么，随便起~";
    nameTF.borderStyle = UITextBorderStyleRoundedRect;
    [view addSubview:nameTF];
    
    
    
    phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, nameTF.bottom+20, width-40, 30)];
    phoneLabel.text = @"请输入您的电话号码:";
    phoneLabel.font = [UIFont systemFontOfSize:13*K_WIDTH/320];
    phoneLabel.textColor = [UIColor orangeColor];
//    [view addSubview:phoneLabel];
    
    phoneTF = [[UITextField alloc] initWithFrame:CGRectMake(20, phoneLabel.bottom+10, width-40, 40)];
    phoneTF.placeholder = @"请输入您的电话号码";
    phoneTF.borderStyle = UITextBorderStyleRoundedRect;
//    [view addSubview:phoneTF];
    
    
    btn = [[UIButton alloc] initWithFrame:CGRectMake(40, view.height - 60, width-80, 40)];
    [btn setTitle:@"生成账本" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"tiao_green"] forState:UIControlStateNormal];
    [btn addTarget: self action:@selector(createAction:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    
    
}

#pragma mark - 注册键盘通知
- (void)registKeyNotification
{
    // 注册键盘通知
    
    //注册键盘出现的通知
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrameNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillChangeFrameNotification:(NSNotification *)notification
{
    NSLog(@"1");
    
    CGFloat v_x = view.frame.origin.x;
    
    view.frame = CGRectMake(v_x, 50, 250*K_WIDTH/320, 270*K_WIDTH/320);
    
}
- (void)keyboardWillHideNotification:(NSNotification *)notification
{
    view.center = self.center;
}

// 点击页面空白出 收取键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [super touchesBegan:touches withEvent:event];
    [self endEditing:YES];
}

// 删除通知
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)myBlockName:(MyBlockName)myBlockName
{
    self.myBlockName = myBlockName;
}

- (void)createAction:(UIButton *)button
{
    [self removeFromSuperview];
    if(self.myBlockName){
        self.myBlockName(nameTF.text);
    }
    
    
    
}

@end
