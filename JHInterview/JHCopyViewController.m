//
//  JHCopyViewController.m
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/10.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "JHCopyViewController.h"
#import "Person.h"
#import "Person1.h"

@interface JHCopyViewController ()

@property (nonatomic ,strong) NSMutableArray *strongArray;
@property (nonatomic ,copy) NSMutableArray *copyyArray;
@property (nonatomic ,retain) NSMutableArray *retainArray;

@end

@implementation JHCopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *string = @"hello world";
    [string copy]; //--> 拷贝出内容为hello world的NSString类型的字符串
    [string mutableCopy]; //--> 拷贝出内容为hello world的NSMutableString类型的字符串
    
    NSDictionary *dict = @{@"name" : @"hello world"};
    [dict copy]; //--> 拷贝出内容与dict相同的NSDictionary类型的字典
    [dict mutableCopy]; //--> 拷贝出内容与dict相同的NSMut
    
    NSArray *array = @[@"hello world"];
    [array copy];// --> 拷贝出内容与array相同的NSArray类型的数组
    [array mutableCopy];// --> 拷贝出内容与array相同的NSMutableArray类型的数组
    
    NSMutableArray *tempArray = [NSMutableArray array];
    [tempArray addObject:@"hello"];
    
    self.strongArray = tempArray;
    self.copyyArray = tempArray;
    self.retainArray = tempArray;
    NSMutableArray *tempCopyArray = [tempArray mutableCopy];
    
    [tempArray addObject:@"world"];
    
    NSLog(@"temptArray = %@ &temptArray = %p \n copyyArray = %@ &copyyArray = %p \n strongArray = %@ &strongArray = %p  \n tempCopyArray = %@ &tempCopyArray = %p \n retainArray = %@ &retainArray = %p \n",tempArray,tempArray,self.copyyArray,self.copyyArray,self.strongArray,self.strongArray,tempCopyArray,tempCopyArray,self.retainArray,self.retainArray);
    //为什么@property中的NSString, NSArray, NSDictionary属性为什么大多时候用copy而不用strong的原因?
    
    [self deepCopy];
    
    [self deepObjectCopy];
    
    [self trueDeepObjectCopy];
}

#pragma mark 完全copy，
- (void)deepCopy {
    //实现完全深拷贝
    //a、通过对子对象也进行mutable方法来实现
    //b、通过对对象归档解档来实现
    NSMutableArray * array1=[NSMutableArray arrayWithObjects: @"1",@"2",@"3",@"4",nil];
    NSMutableArray * array2=[NSMutableArray arrayWithObjects: @"a",@"b",@"c",@"d",array1, nil];
    NSMutableArray *array3 = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:array2]];
    array1[2] = @"change";
    NSLog(@"array3：%@",array3);
    NSLog(@"array2：%@",array2);
}

- (void)deepObjectCopy {
    Person *p1 = [[Person alloc] init];
    Person *p2 = [[Person alloc] init];
    NSArray *array = @[p1, p2];
    NSArray *cpyArray = [array copy];
    NSMutableArray *mutCopyArray = [array mutableCopy];
    
    NSLog(@"数组内部对象的copy机制 %@ - %@ - %@\n array = %p \n cpyArray = %p \n mutCopyArray = %p", array, cpyArray,mutCopyArray,array,cpyArray,mutCopyArray);
}

- (void)trueDeepObjectCopy {
    Person1 *p1 = [[Person1 alloc] init];
    Person1 *p2 = [[Person1 alloc] init];
    NSArray *array = @[p1, p2];
    
    //使用该方法的前提是被拷贝对象实现了copyWithZone 方法
    NSMutableArray *trueDeepCopyArray1 = [[NSMutableArray alloc] initWithArray:array copyItems:YES];
    
    //过对对象归档解档来实现,使用该方法的前提是实现了NSCoding协议
    NSArray* trueDeepCopyArray2 = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:array]];
    
    NSLog(@"trueDeepObjectCopy机制1 %@ - %@ \n array = %p \n trueCopyArray1 = %p \n", array, trueDeepCopyArray1, array, trueDeepCopyArray1);
    NSLog(@"trueDeepObjectCopy机制2 %@ - %@ \n array = %p \n trueCopyArray2 = %p \n", array, trueDeepCopyArray2, array, trueDeepCopyArray2);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
