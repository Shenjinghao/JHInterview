//
//  ReverseString.h
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/11.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReverseString : NSObject



@end

void jhDoReverse(char *string,int left,int right) {
    if(string==NULL || left>=right)return;
    while(left<right){
        char temp = string[right];
        string[right]=string[left];
        string[left]=temp;
        left++;
        right--;
    }
}

void reverseAnother(char *string,int len){
    if(string==NULL || len<=0)return ;
    //先全部翻转
    jhDoReverse(string,0,len-1);
    //" dlrow olleh "
    
    //wordend找到下一个位置的空格，begin是记录第一个空格后的位置
    int wordBegin=0,wordNext=0;
    
    while(string[wordBegin] != '\0'){
        
        if(string[wordBegin] == ' '){
            
            wordNext++;
            wordBegin++;
        }else if(string[wordNext] == ' ' || string[wordNext]=='\0'){
            //wordnext的前一位是空格
            jhDoReverse(string,wordBegin,--wordNext);
            //讲begin设为wordnext位置的（空格）下一位
            wordBegin = ++wordNext;
        }else{
            wordNext++;
        }
    }
    return ;
}





