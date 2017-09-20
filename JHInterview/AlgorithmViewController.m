//
//  AlgorithmViewController.m
//  JHInterview
//
//  Created by jinghao shen on 2017/8/24.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "AlgorithmViewController.h"

@interface AlgorithmViewController ()

@end

@implementation AlgorithmViewController

int array[10] = {24, 17, 85, 13, 9, 54, 76, 45, 5, 63};
int num = sizeof(array)/sizeof(int);
char a1[] = "abc";
int num1 = sizeof(a1)/sizeof(char);

+ (void)load {
    [super load];
    
    
    printf("%lu,%lu,%lu %ld %d\n",sizeof(array),sizeof(int),sizeof(array)/sizeof(int),array,num);
    printf("%lu,%lu,%lu %ld %d\n",sizeof(a1),sizeof(char),sizeof(a1)/sizeof(char),a1,num1);
    
    
    node *head = createLinkList(7);
    
    if (head) {
        
        printLinkList(head);
        
        node *reHead = reverseFunc1(head);
        
        printLinkList(reHead);
        
        free(reHead);
        
    }
    
    free(head);
    
}

+ (void)initialize {
    [super initialize];
    
    char *str = "hello world";
    /*
     po str
     "hello world"
     
     po *str
     'h'
     
     po &str
     0x00007fff5c26f698
     
     str++
     po str
     "ello world"
     po *str
     'e'
     
     *str++
     po str
     "ello world"
     po *str
     'e'
     
     综上 不管是指针变量str还是指针*str，++后都首位都指向下一个字符
     */
    
    
    printf("指针的相关问题  str = %s *str = %P,&str = %d  stt++ = %s *str++ = %P",str,*str,&str,str++ ,*str++);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 %@:            Objective-C对象,印有字符串返回descriptionWithLocale:如果于的话,或描述相反.CFTypeRef工作对象,返回的 结果的CFCopyDescription功能.(这个翻译有问题建议按照自己的理解方式理解)。
 %%:            为'%'字符;
 %d,%D,%i:  为32位整型数(int);
 %u,%U:        为32位无符号整型数(unsigned int);
 %hi:  为有符号的16位整型数(short);
 %hu:  为无符号的16位整型数(unsigned shord);
 %qi:  为有符号的64位整型数(long long);
 %qu:  为无符号的64位整型数(unsigned long long);
 %x:    为32位的无符号整型数(unsigned int),打印使用数字0-9的十六进制,小写a-f;
 %X:    为32位的无符号整型数(unsigned int),打印使用数字0-9的十六进制,大写A-F;
 %qx:  为无符号64位整数(unsigned long long),打印使用数字0-9的十六进制,小写a-f;
 %qX:  为无符号64位整数(unsigned long long),打印使用数字0-9的十六进制,大写A-F;
 %o,%O:  为32位的无符号整数（unsigned int),打印八进制数;
 %f:      为64位的浮点数(double);
 %e:      为64位的浮点数(double),打印使用小写字母e,科学计数法介绍了指数的增大而减小;
 %E:      为64位的浮点数(double),打印科学符号使用一个大写E介绍指数的增大而减小;
 %g:      为64位的浮点数(double),用%e的方式打印指数,如果指数小于4或者大于等于精度,那么%f的风格就会有不同体现;
 %G:      为64位的浮点数(double),用%E的方式打印指数,如果指数小于4或者大于等于精度,那么%f的风格就会有不同体现;
 %c:      为8位的无符号字符%c(unsigned char),通过打印NSLog()将其作为一个ASCII字符,或者,不是一个ASCII字符,八进制格式\ddd或统一标准的字符编码的十六进制格式\udddd,在这里d是一个数字;
 %C:      为16位Unicode字符%C(unichar),通过打印NSLog()将其作为一个ASCII字符,或者,不是一个ASCII字符,八进制格式\ddd或统一标准的字符编码的十六进制格式\\udddd,在这里d是一个数字;
 %s:      对于无符号字符数组空终止,%s系统中解释其输入编码,而不是别的,如utf-8;
 %S:      空终止一系列的16位Unicode字符;
 %p:      空指针(无效*)，打印十六进制的数字0-9和小写a-f,前缀为0x;
 %L:      在明确规定的长度下,进行修正,下面的一批数据a,A,e,E,f,F,g,G应用于双精度长整型的参数;
 %a:      为64位的浮点数(double),按照科学计数法打印采用0x和一个十六进制数字前使用小写小数点p来介绍指数的增大而减小;
 %A:      为64位的浮点数(double),按照科学计数法打印采用0X和一个十六进制数字前使用大写字母小数点P界扫指数的增大而减小；
 %F:      为64位的浮点数(double),按照十进制表示法进行打印；
 %z:      修改说明在%z长度以下d,i,o,u,x,X适用于某一指定类型的转换或者适用于一定尺寸的整数类型的参数;
 %t:      修改说明在%t长度以下d,i,o,u,x,X适用于某一指定类型或一定尺寸的整数类型的转换的参数;
 %j:      修改说明在%j长度以下d,i,o,u,x,X适用于某一指定类型或一定尺寸的整数类型的转换的参数。
 */



//如何实现链表翻转（链表逆序）？
//思路：每次把第二个元素提到最前面来。
typedef struct NODE {
    
    struct NODE *next;
    
    int num;
    
}node;

node *createLinkList(int length) {
    
    if (length <= 0) {
        
        return NULL;
        
    }
    
    node *head,*p,*q;
    
    int number = 1;
    
    head = (node *)malloc(sizeof(node));
    
    head->num = 1;
    
    head->next = head;
    
    p = q = head;
    
    while (++number <= length) {
        
        p = (node *)malloc(sizeof(node));
        
        p->num = number;
        
        p->next = NULL;
        
        q->next = p;
        
        q = p;
        
    }
    
    return head;
}

//打印链表
void printLinkList(node *head) {
    
    if (head == NULL) {
        
        return;
        
    }
    
    node *p = head;
    
    while (p) {
        
        printf("%d ", p->num);
        
        p = p -> next;
        
    }
    
    printf("\n");
    
}


node *reverseFunc1(node *head) {
    
    if (head == NULL) {
        
        return head;
    }
    node *p,*q;
    
    p = head;
    
    q = NULL;
    
    while (p) {
        
        node *pNext = p -> next;
        
        p -> next = q;
        
        q = p;
        
        p = pNext;
        
    }
    
    return q;
    
}


//实现一个字符串“how are you”的逆序输出（编程语言不限）。如给定字符串为“hello world”,输出结果应当为“world hello”。
void reverse(char *pBegin,char *pEnd) {
    if (pBegin == NULL || pEnd == NULL) {
        return;
    }
    while (pBegin < pEnd) {
        char temp = *pBegin;
        *pBegin = *pEnd;//crash
        *pEnd = temp;
        pBegin ++,pEnd --;
    }
}

void reverseSentence(char *pData) {
    if (pData == NULL) {
        return;
    }
    //*是取出字符串的第一个字符
    //指针变量++ 是指向下个字符
    char *pBegin = pData;
    
    char *pEnd = pData;
    while (*pEnd != '\0') {
        pEnd ++;
    }
    pEnd --;
    //以上代码是找到字符的最后一位
    
    
    reverse(pBegin, pEnd);
    
    pBegin = pEnd = pData;
    while (*pBegin != '\0') {
        if (*pBegin == ' ') {
            
            pBegin ++,pEnd ++;
        }else if (*pEnd == ' ' || *pEnd == '\0'){
            reverse(pBegin, --pEnd);
            pBegin = ++pEnd;
        }else {
            pEnd ++;
        }
    }
    printf("%s",pData);
    
}
@end
