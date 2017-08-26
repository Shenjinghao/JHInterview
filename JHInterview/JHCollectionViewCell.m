//
//  JHCollectionViewCell.m
//  JHInterview
//
//  Created by jinghao shen on 2017/8/24.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "JHCollectionViewCell.h"

@implementation JHCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createViews];
    }
    return self;
}

- (void)createViews {
    
    _countLabel = [[UILabel alloc] init];
    
    _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.backgroundColor = [UIColor whiteColor];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.layer.borderColor = [UIColor blueColor].CGColor;
    _titleLabel.layer.borderWidth = 2;
    [self.contentView addSubview:_titleLabel];
}

@end
