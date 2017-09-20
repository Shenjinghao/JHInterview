//
//  OtherViewController.m
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/13.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //百度面试题   alloc 后的内存地址和 init后的一样
    NSString *test = [NSString alloc];
    NSLog(@"alloc 后的内存地址 %p",test);
    [test init];
    NSLog(@"init 后的内存地址 %p",test);
    
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
