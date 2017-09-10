//
//  JHCopyViewController.h
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/10.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 深拷贝
      - 不完全深拷贝
      - 完全深拷贝
 浅拷贝，
 深拷贝 : 拷贝出来的对象与源对象地址不一致! 这意味着我修改拷贝对象的值对源对象的值没有任何影响.
 浅拷贝 : 拷贝出来的对象与源对象地址一致! 这意味着我修改拷贝对象的值会直接影响到源对象.
 */
@interface JHCopyViewController : UIViewController

@end
