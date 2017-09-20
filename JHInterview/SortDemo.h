//
//  SortDemo.h
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/11.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SortDemo : NSObject

@end

//int array[10] = {24, 17, 85, 13, 9, 54, 76, 45, 5, 63};
//int num = sizeof(array)/sizeof(int);
//char a1[] = "abc";
//int num1 = sizeof(a1)/sizeof(char);
//
//
//void printfLog(int a[], int num,char *str) {
//    printf("\n %s \n",str);
//    for(int i = 0; i < num; i++) {
//        
//        printf(" %d", array[i]);
//        
//        if(i == num-1) {
//            
//            printf("\n");
//            
//        }
//        
//        else {
//            
//            printf(" ");
//            
//        }
//        
//    }
//}
//
////冒泡
//void bubbleSort(int array[], int num) {
//    
//    for(int i = 0; i < num-1; i++) {
//        
//        for(int j = 0; j < num - 1 - i; j++) {
//            
//            if(array[j] < array[j+1]) {
//                
//                int tmp = array[j];
//                
//                array[j] = array[j+1];
//                
//                array[j+1] = tmp;
//                
//            }
//            
//        }
//    }
//    printfLog(array,num,"冒泡");
//}
//
//void ascendingSort(int a[],int n)
//{
//    
//    int i, j, index;
//    
//    for(i = 0; i < n - 1; i++) {
//        
//        index = i;
//        
//        for(j = i + 1; j < n; j++) {
//            
//            if(a[index] > a[j]) {
//                
//                index = j;
//                
//            }
//            
//        }
//        
//        if(index != i) {
//            
//            int temp = a[i];
//            
//            a[i] = a[index];
//            
//            a[index] = temp;
//            
//        }
//        
//    }
//    printfLog(array, num, "选择");
//    
//}
//
//void quickSort(int a[], int left, int right) {
//    
//    if(left >= right) {
//        
//        return ;
//    }
//    
//    int i = left;
//    
//    int j = right;
//    
//    int key = a[left];
//    
//    while (i < j) {
//        
//        while (i < j && key <= a[j]) {
//            
//            j--;
//            
//        }
//        
//        a[i] = a[j];
//        
//        while (i < j && key >= a[i]) {
//            
//            i++;
//            
//        }
//        
//        a[j] = a[i];
//        
//    }
//    
//    a[i] = key;
//    
//    quickSort(a, left, i-1);
//    
//    quickSort(a, i+1, right);
//    
//    printfLog(array, num, "快排");
//}
//
////二分查找算法
//int bsearchWithoutRecursion(int array[],int low,int high,int target) {
//    
//    while(low <= high) {
//        
//        int mid = (low + high) / 2;
//        
//        if(array[mid] > target)
//            
//            high = mid - 1;
//        
//        else if(array[mid] < target)
//            
//            low = mid + 1;
//        
//        else	//findthetarget
//            
//            return mid;
//        
//    }
//    
//    //the array does not contain the target
//    
//    return -1;
//    
//}
//
////递归实现
//
//int binary_search(const int arr[],int low,int high,int key)
//{
//    
//    int mid=low + (high - low) / 2;
//    
//    if(low > high)
//        
//        return -1;
//    
//    else{
//        
//        if(arr[mid] == key)
//            
//            return mid;
//        
//        else if(arr[mid] > key)
//            
//            return binary_search(arr, low, mid-1, key);
//        
//        else
//            return binary_search(arr, mid+1, high, key);
//        
//    }
//}


