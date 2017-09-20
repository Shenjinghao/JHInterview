//
//  MethodChainingViewController.m
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/11.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "MethodChainingViewController.h"
#import "NSObject+Caculate.h"
#import "CaculateManager.h"

@interface MethodChainingViewController ()

@end

@implementation MethodChainingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int a = 5, b = 6;
    int result = [NSObject calulate:^(CaculateManager *manager) {
        manager.add(a).add(b);
    }];
    
    NSLog(@" %d + %d = %d",a,b,result);
    
    int c = 5, d = 6;
    int result2 = [NSObject calulate:^(CaculateManager *manager) {
        manager.sub(d).sub(c);
    }];
    
    NSLog(@" %d - %d = %d",d,c,result2);
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
