//
//  ViewController.m
//  JHInterview
//
//  Created by jinghao shen on 2017/8/23.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "ViewController.h"
#import "JHCollectionViewCell.h"
#import "VCLifeViewController.h"
#import "StrongWeakDanceViewController.h"
#import "GCDViewController.h"
#import "AlgorithmViewController.h"
#import "LinkListViewController.h"
#import "JHCopyViewController.h"
#import "LoadClassA.h"
#import "InitializeBaseClass.h"
#import "InitializeClassA.h"
#import "MethodChainingViewController.h"
#import "JHEncryptionViewController.h"
#import "OtherViewController.h"
#import "NetworkingTestViewController.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, copy) NSArray *dataArray;

@property (nonatomic, strong) UICollectionView *collectionView;

@end

static NSString *const cellId = @"collectionCellId";
static NSString *const header = @"collectionHeader";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.dataArray = @[@"VC的生命周期", @"Block", @"GCD", @"算法", @"算法-链表",@"copy的坑",@"load",@"initialize",@"链式编程",@"加密",@"网略请求",@"其他"];
    
    [self createCollectionView];
    
}

- (void)createCollectionView {
    
    //自定义流水布局
    UICollectionViewFlowLayout *collectionFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    //滑动方向
    collectionFlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置headerView的尺寸大小
    collectionFlowLayout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 60);
    //设置itemSize
    collectionFlowLayout.itemSize =CGSizeMake(self.view.frame.size.width / 2, 80);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:collectionFlowLayout];
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.collectionView];
    
    //注册collectionViewCell和header
    [self.collectionView registerClass:[JHCollectionViewCell class] forCellWithReuseIdentifier:cellId];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:header];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

#pragma mark dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *collectionHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:header forIndexPath:indexPath];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:collectionHeaderView.bounds];
    headerLabel.text = @"面试资料总结";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    [collectionHeaderView addSubview:headerLabel];
    return collectionHeaderView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JHCollectionViewCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    collectionCell.countLabel.text = [NSString stringWithFormat:@"{%ld, %ld}",indexPath.section, indexPath.row];
    collectionCell.titleLabel.text = self.dataArray[indexPath.row];
    return collectionCell;
}

#pragma mark delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    JHCollectionViewCell *cell = (JHCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSLog(@"%@",cell.countLabel.text);
    switch (indexPath.row) {
        case 0: {
            VCLifeViewController *controller = [[VCLifeViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 1: {
            StrongWeakDanceViewController *controller = [[StrongWeakDanceViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 2: {
            GCDViewController *controller = [[GCDViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 3: {
            AlgorithmViewController *controller = [[AlgorithmViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 4: {
            LinkListViewController *controller = [[LinkListViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 5: {
            JHCopyViewController *controller = [[JHCopyViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 6: {
            LoadClassA *controller = [[LoadClassA alloc] init];
//            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 7: {
            InitializeClassA *controller = [[InitializeClassA alloc] init];
//            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 8: {
            MethodChainingViewController *controller = [[MethodChainingViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 9: {
            JHEncryptionViewController *controller = [[JHEncryptionViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 10: {
            NetworkingTestViewController *controller = [[NetworkingTestViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 100: {
            OtherViewController *controller = [[OtherViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        default:
            break;
    }
    
}

#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(120, 90);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (void)viewWillAppear:(BOOL)animated {
    //pop 回来的时候会调用
    
}

- (void)viewDidAppear:(BOOL)animated {
    //pop 回来的时候会调用
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
