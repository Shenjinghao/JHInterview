//
//  AlgorithmViewController.h
//  JHInterview
//
//  Created by jinghao shen on 2017/8/24.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlgorithmViewController : UIViewController

@end


void bubbleSort(int array[], int num);

/*
 归并排序： 自底向上分治策略
 4 2 5 7 1 2 6 3
 4 | 2  |  5 | 7   |   1 | 2  |  6 | 3
 
 4 2 5 7   |   1 2 6 3
 2 4  |  5 7   |   1 2  |  3 6
 
 4 2  |  5 7   |   1 2  |  6 3
 2 4 5 7   |   1 2 3 6
 
 4 | 2  |  5 | 7   |   1 | 2  |  6 | 3
 1 2 2 3 4 5 6 7
 */

/*
 快排：自顶向下分治策略
 4 2 5 7 1 2 6 | 3
 
 2 1 2   |   3   |   7 4 5 6
 
 1  |  2  |  2   |   3   |   4 5  |  6  |  7
 
 1  |  2  |  2   |   3   |   4 | 5  |  6  |  7
 */


