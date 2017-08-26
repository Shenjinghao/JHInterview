//
//  VCLifeViewController.m
//  JHInterview
//
//  Created by jinghao shen on 2017/8/24.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "VCLifeViewController.h"
#import "VCLifeXibViewController.h"
#import "LifeView.h"

@interface VCLifeViewController ()

@property (nonatomic, strong) VCLifeXibViewController *lifeVC;

@property (nonatomic, strong) LifeView *lifeView;

@end

@implementation VCLifeViewController

- (instancetype)init {
    //1
    //(lldb) po self.view
    //error: Execution was interrupted, reason: EXC_BAD_ACCESS (code=2, address=0x7fff5d76dff8).
    //    The process has been returned to the state before expression evaluation.
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    //是一个类在IB中创建但在xocde中被实例化时被调用的
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
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
    //3 initWithNibName后调用
    //(调用多次)
    //处理死循环
    [super loadView];
}

- (UIView *)viewIfLoaded {
    return nil;
}

- (void)viewWillUnload {
    //不建议使用
}

- (void)viewDidUnload {
    
}

- (void)viewDidLayoutSubviews {
    //viewWillAppear后调用
    //loadview正常的话
}

- (void)viewWillAppear:(BOOL)animated {
    //5 viewDidLoad后调用
    
}

- (void)viewDidAppear:(BOOL)animated {
    //6  viewDidLayoutSubviews后调用
    
}

- (void)viewWillDisappear:(BOOL)animated {
    //pop 1
}

- (void)viewDidDisappear:(BOOL)animated {
    //pop 2
}

- (void)viewDidLoad {
    //4 loadView后调用
    //(调用多次)
    [super viewDidLoad];
    //没有初始化view  crash reason: EXC_BAD_ACCESS (code=2, address=0x7fff5d76dff8).
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 200, self.view.frame.size.width - 40, 50);
    button.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(buttonDidClicked) forControlEvents:UIControlEventTouchUpInside];
    
    //添加lifeview，检测view生命周期
    self.lifeView = [[LifeView alloc] initWithFrame:CGRectMake(10, 500, 200, 20)];
//    self.lifeView = [[LifeView alloc] init];
    [self.view addSubview:self.lifeView];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)buttonDidClicked {
    _lifeVC = [[VCLifeXibViewController alloc] init];
    [self.navigationController pushViewController:_lifeVC animated:YES];
    
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
