//
//  LinkListViewController.m
//  JHInterview
//
//  Created by jinghao shen on 2017/8/26.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "LinkListViewController.h"

@interface LinkListViewController ()



@end


@implementation LinkListViewController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //创建链表
    [self CreateHeadLink:9];
    
    [self CreateTailLink:6];
    
//    [self LinkedListInertdata:11 linkList:_node];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//打印链表
-(void) printLinkList:(Node *)head {
    
    if (head == NULL) return;
    
    Node *p = head;
    
    while (p) {
        printf("%d ", p->value);
        p = p->pNext;
        
    }
    printf("\n");
    
}

//链表反转
void reverseListNode (Node *pHead) {
    
}

//http://blog.csdn.net/wp1603710463/article/details/50989500
//用头插法创建带头结点的单链表
-(void) CreateHeadLink:(int)n
{
    Node *L=(Node *)malloc(sizeof(Node));
    if(L==NULL)
    {
        printf("申请空间失败！");
    }
    //创建的头结点是null
    L->pNext=NULL;
    
    for(int i=1; i < n; i++)
    {
        Node *p;
        p=(Node *)malloc(sizeof(Node));
        if(p==NULL)
        {
            printf("申请空间失败！");
        }
        //给链表p赋值
        p->value=i;
        p->pNext=L->pNext;//如果是创建的第一个节点，L->pNext = null
        
        L->pNext=p;
        
    }
    printf("头插法创建\n");
    [self printLinkList:L];
    //打印出来的链表首位是0，说明头结点是空的一位。（带有头结点）
    _node = L;
}
//用尾插法创建带头结点的单链表
-(void) CreateTailLink:(int)n
{
    Node *L=(Node *)malloc(sizeof(Node));
    if(L==NULL)
    {
        printf("申请空间失败！");
    }
    L->pNext=NULL;
    Node *tail=L;         //设置尾指针,记录最新插入的，方便插入
    
    for(int j=1; j<n; j++)
    {
        Node *p=(Node *)malloc(sizeof(Node));
        if(p==NULL)
        {
            printf("申请空间失败！");
        }
        
        p->value=j;
        p->pNext=NULL;
        tail->pNext = p;
        tail=p;
    }
    printf("尾插法创建\n");
    [self printLinkList:L];
}

//带头结点的单链表的插入操作
//注意  这里需要传入添加的节点信息
//void LinkedListDeleteQE1(LinkedList L, LinkedList p, ElemType e)

- (void)LinkedListInertdata:(int)data linkList:(Node *)L
{
    
    Node *p = (Node *)malloc(sizeof(Node));
    Node *q = (Node *)malloc(sizeof(Node));        //创建一个新的结点q
    if(q==NULL)
    {
        printf("申请空间失败！");
        /*
         exit（0）：正常运行程序并退出程序；
         
         exit（1）：非正常运行导致退出程序；
         
         return（）：返回函数，若在主函数中，则会退出函数并返回一值。
         */
        exit(0);
    }
    //q为要插入的链表
    q->value=data;
    //插入到p链表的前面
    p->value = 2;
    //插入新的结点
    Node *pre=L;
    while((pre!=NULL)&&(pre->pNext!=p)) {
        
        pre=pre->pNext;
    }//寻找p的前驱
    q->pNext=pre->pNext;
    pre->pNext=q;
    
    printf("插入节点\n");
    [self printLinkList:pre];
}





@end
