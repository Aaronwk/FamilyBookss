//
//  Write_ViewController.m
//  FamilyBooks
//
//  Created by 王凯 on 16/3/3.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import "Write_ViewController.h"
#import "HeaderForGlobal.h"
#import "Write01_inComeView.h"

@interface Write_ViewController ()
{
    
}

@end

@implementation Write_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:[Write01_inComeView shareInstance]];
    
//    [self createNavigation];
    
    
}


- (void)createNavigation
{
    UIView *navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, K_WIDTH, 64)];
    navigationView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navigationView];
    
    //初始化UISegmentedControl
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"1",@"2",nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    //    segmentedControl = segmentedTemp;
    segmentedControl.frame =CGRectMake(K_WIDTH/2-50,25,100,30);
    
    [segmentedControl setTitle:@"收入"forSegmentAtIndex:0];//设置指定索引的题目
    [segmentedControl setTitle:@"支出"forSegmentAtIndex:1];//设置指定索引的题目
    
    segmentedControl.tintColor = [UIColor orangeColor];
    segmentedControl.selectedSegmentIndex = 0;
    
    [segmentedControl addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
    
    [navigationView addSubview:segmentedControl];
    
}

- (void)changeValue:(UISegmentedControl *)sender
{
   NSInteger index = [sender selectedSegmentIndex];
    if(index == 0){
        NSLog(@"收入");
    }else{
        NSLog(@"支出");
    }
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
