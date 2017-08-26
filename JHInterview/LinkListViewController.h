//
//  LinkListViewController.h
//  JHInterview
//
//  Created by jinghao shen on 2017/8/26.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import <UIKit/UIKit.h>

//定义链表结构体
//struct ListNode {
//    int value;
//    struct listNode *pNext;
//};
typedef struct ListNode {
    int value;
    struct listNode *pNext;
}Node;

@interface LinkListViewController : UIViewController

@property (nonatomic ,assign) Node *node;

@end
