//
//  VCLifeXibViewController.m
//  JHInterview
//
//  Created by jinghao shen on 2017/8/24.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "VCLifeXibViewController.h"

@interface VCLifeXibViewController ()

@property (weak, nonatomic) IBOutlet UIButton *IBButton;

@end

@implementation VCLifeXibViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    //是一个类在IB中创建但在xocde中被实例化时被调用的
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib {
    //不调用父类会报警告
    [super awakeFromNib];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    //2 init后调用
    //来查找XIB中有没有视图view
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
