//
//  HomeMain01_ViewController.m
//  FamilyBooks
//
//  Created by 王凯 on 16/3/1.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import "HomeMain01_ViewController.h"
#import "HeaderForGlobal.h"

@interface HomeMain01_ViewController ()
{
    Home01_createUserNameView *userNameView;
    Home01_view *cv1;
    Home02_view *cv;
}
@end

@implementation HomeMain01_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    self.view.backgroundColor = [UIColor redColor];
    
    cv = [Home02_view shareInstance];
    
    cv1 =[Home01_view shareInstance];
    
    [self.view addSubview:cv1];
    [self.view addSubview:cv];
    
    self.leftView = cv1;
    self.rightView = cv;
    
    [self createFirstViewForName];
    
    
    
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector (SwitchView:) name:@"SwitchView" object:nil];
    
}




- (void)SwitchView:(NSNotification *)notification
{
    NSLog(@"第%@页", [notification.userInfo objectForKey:@"indexPath"]);
}

- (void)createFirstViewForName
{
    
   NSString * flag = [[NSUserDefaults standardUserDefaults] stringForKey:@"First"];
    NSLog(@"ddd%@", flag);
    
    if([flag isEqualToString:@"YES"]){
        NSLog(@"sss%@", [[NSUserDefaults standardUserDefaults] stringForKey:@"user_name"]);
        NSString *strname = [NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults] stringForKey:@"user_name"]];
        cv.name.text = strname;
       
    }else{
        
        userNameView = [[Home01_createUserNameView alloc] initWithFrame:CGRectMake(0, 0, K_WIDTH, K_HEIGHT)];
        [[UIApplication sharedApplication].keyWindow addSubview:userNameView];
        
        [userNameView myBlockName:^(NSString *strName) {
            cv.name.text = strName;
            
            NSUserDefaults *mySettingData = [NSUserDefaults standardUserDefaults];
            [mySettingData setObject:strName forKey:@"user_name"];
            [mySettingData synchronize];
            
            
            NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
            [userdefaults setObject:@"YES" forKey:@"First"];
            [userdefaults synchronize];
        
         }];
        
    }
    
    
    
    
}

@end
