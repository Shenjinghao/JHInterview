//
//  StrongWeakDanceViewController.h
//  JHInterview
//
//  Created by jinghao shen on 2017/8/23.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import <UIKit/UIKit.h>

//定义block
typedef void(^StrongWeakBlock)(NSString *str, NSInteger num);

typedef void(^StrongWeakDanceBlock)(NSString *str);

@interface StrongWeakDanceViewController : UIViewController

@property (nonatomic, copy) StrongWeakBlock strongWeakBlock;

@property (nonatomic, copy) StrongWeakDanceBlock strongWeakDanceBlock;
@property (nonatomic, copy) StrongWeakDanceBlock WeakDanceBlock;
@property (nonatomic, copy) StrongWeakDanceBlock strongWeakDanceBlockSuccess;

@end
