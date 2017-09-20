//
//  ExchangeNumWithoutTemp.h
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/11.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExchangeNumWithoutTemp : NSObject


@end




//不用新的变量，交换两个数字
void exchangeNumWithoutTemp(int num1, int num2) {
    if (num1 == num2) {
        return;
    }
    num1 = num1 + num2;
    num2 = num1 - num2;
    num1 = num1 - num2;
    printf("不用新的变量，交换两个数字 5 8 交换后的 num1 = %d num2 = %d  \n",num1,num2);
}
