//
//  StrongWeakDanceViewController.m
//  JHInterview
//
//  Created by jinghao shen on 2017/8/23.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "StrongWeakDanceViewController.h"

@interface StrongWeakDanceViewController ()

@property (nonatomic, strong) NSString *str;

@end

@implementation StrongWeakDanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //捕获外部变量
    [self blockUse];
    
    //weak_strong_dance
//    [self block2Use];
    
    [self block3Use];
    
    [self block4Use];
    
    [self block5Use];
    
}

- (void)blockUse {
    
    NSString *str = @"hello";
    NSInteger num = 110;
    
    __block NSString *str1 = @"hello";
    __block NSInteger num1 = 110;
    
    static NSString *str2 = @"hello";
    static NSInteger num2 = 110;
    
    const NSString *str3 = @"hello";
    NSString const *str33 = @"hello";
    NSString *const str333 = @"hello";
    const int num3 = 110;
    
    NSArray *array = @[@"a",@"b"];
    __block NSArray *array1 = @[@"a",@"b"];
    NSMutableArray *mutArray = [NSMutableArray arrayWithObjects:@"a",@"b", nil];
    NSDictionary *dict = @{@"key":@"a"};
    NSMutableDictionary *mutDict = [NSMutableDictionary dictionaryWithObject:@"a" forKey:@"key"];
    
    //block先实现再调用
    _strongWeakBlock = ^(NSString *str, NSInteger num) {
        
        //变更临时变量
        str = [NSString stringWithFormat:@"world"];
        num = 1100;
        
        //__block修饰的临时变量
        str1 = [NSString stringWithFormat:@"world"];
        num1 = 1100;
        
        //static修饰的变量
        str2 = [NSString stringWithFormat:@"world"];
        num2 = 1100;
        
        //const修饰的变量 不能修改，报错
//        str3 = [NSString stringWithFormat:@"world"];
//        str33 = [NSString stringWithFormat:@"world"];
//        str333 = [NSString stringWithFormat:@"world"];
//        num3 = 1100;
        int *num_3 = &num3;
        *num_3 = 1100;
        
        //临时变量是数组、字典
        //不可变数组，一旦创建，不能添加、删除或修改其中的元素
        [array arrayByAddingObject:@"c"];
        [array1 arrayByAddingObject:@"d"];
        [mutArray addObject:@"c"];
        [dict setValue:@"c" forKey:@"key"];
        [mutDict setValue:@"c" forKey:@"key"];
        
        
        NSLog(@"更改临时变量后的block内部：临时变量 str = %@  num = %ld  __Block修饰过的str1 = %@  num1 = %ld  static修饰的 str2 = %@  num2 = %ld  const修饰的变量num3 = %d",str, num, str1, num1, str2, num2, num3);
        NSLog(@"更改临时数组字典  array = %@ array1 = %@ mutArray = %@ dict = %@ mutDict = %@",array,array1,mutArray,dict,mutDict);
    };
    
    if (_strongWeakBlock) {
        _strongWeakBlock(str,num);
    }
    
    NSLog(@"更改临时变量后的block外部：临时变量 str = %@  num = %ld  __Block修饰过的str1 = %@  num1 = %ld  static修饰的 str2 = %@  num2 = %ld  const修饰的变量num3 = %d",str, num, str1, num1, str2, num2, num3);
    
    NSLog(@"更改临时数组字典  array = %@ array1 = %@ mutArray = %@ dict = %@ mutDict = %@",array,array1,mutArray,dict,mutDict);
    
}

#pragma mark 循环引用
//- (void)block2Use {
//    self.str = @"hello world";
//    _strongWeakDanceBlock = ^(NSString *str){
//        self.str = @"你好，世界";
//        str = self.str;
//        NSLog(@"weak_strong_dance %@",str);
//    };
//    
//    if (_strongWeakDanceBlock) {
//        self.strongWeakDanceBlock(self.str);
//    }
//}

- (void)block3Use {
    self.str = @"hello world";
    __weak StrongWeakDanceViewController *weakSelf = self;
    _WeakDanceBlock = ^(NSString *str){
        weakSelf.str = @"你好，世界";
        str = weakSelf.str;
        NSLog(@"weak_strong_dance %@",str);
    };
    
    if (_WeakDanceBlock) {
        self.WeakDanceBlock(self.str);
    }
}

- (void)block4Use {
    self.str = @"hello world";
    __weak StrongWeakDanceViewController *weakSelf = self;
    _strongWeakDanceBlockSuccess = ^(NSString *str){
        __strong StrongWeakDanceViewController *strongSelf = weakSelf;
        strongSelf.str = @"你好，世界";
        str = strongSelf.str;
        NSLog(@"weak_strong_dance %@",str);
    };
    
    if (_strongWeakDanceBlockSuccess) {
        self.strongWeakDanceBlockSuccess(self.str);
    }
}

- (void)block5Use {
    //如果局部变量是数组或者指针的时候只复制这个指针，两个指针指向同一个地址,block只修改指针上的内容
    //没有修改mArrayCount这个局部变量啊。mArrayCount是一个指针，指向一个可变长度的数组。在block里面，并没有修改这个指针，而是修改了这个指针指向的数组。换句话说，mArrayCount是一个整数，保存的是一块内存区域的地址，在block里，并没有改变这个地址，而是读取出这个地址，然后去操作这块地址空间的内容。
    NSMutableArray *mArray = [NSMutableArray arrayWithObjects:@"a",@"b",@"abc",nil];
    NSMutableArray *mArrayCount = [NSMutableArray arrayWithCapacity:1];
    [mArray enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock: ^(id obj,NSUInteger idx, BOOL *stop){
        [mArrayCount addObject:[NSNumber numberWithInt:[obj length]]];
    }];
    
    NSLog(@"修改后的mutArray%@",mArrayCount);
}

- (void)dealloc {
    
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
