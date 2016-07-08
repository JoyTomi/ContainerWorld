//
//  MainViewController.m
//  ContainerWorld
//
//  Created by JoyTomi on 16/7/7.
//  Copyright © 2016年 JoyTomi. All rights reserved.
//

#import "MainViewController.h"
#import "Masonry.h"
#import "NSString+FontAwesome.h"
#import "SliderViewController.h"
#import "test1ViewController.h"
#import "text2ViewController.h"
#import "text3ViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (instancetype)init {
    if (self = [super init]) {
        self.menuHeight = 40.0;
        self.menuViewStyle = WMMenuViewStyleFloodHollow;
        self.menuItemWidth = 60;
    }
    return self;
}

- (NSArray *)titles {
    return @[@"进口", @"出口", @"数据源"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuView.progressWidths = @[@60, @60, @60];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpNavgateView];
    
    [self addViews];
}

- (void)addViews {
    UIButton *leftView = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, 60, self.menuHeight)];
    [leftView setTitle:@"Left" forState:UIControlStateNormal];
    [leftView setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [leftView addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.menuView.leftView = leftView;
    
    UIButton *rightView = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, 60, self.menuHeight)];
    [rightView setTitle:@"Right" forState:UIControlStateNormal];
    [rightView setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [rightView addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.menuView.rightView = rightView;
    
    self.menuView.contentMargin = 10;
    
}

#pragma mark -WMpageControllerDelegate
#pragma mark - WMPageControllerDataSource
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titles.count;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}


- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    switch (index) {
        case 0: {
            test1ViewController *vc = [[test1ViewController alloc] init];
            return vc;
        }
            break;
        case 1: {
            text2ViewController *vc = [[text2ViewController alloc] init];
            return vc;
        }
        default: {
            return [[text3ViewController alloc] init];
        }
            break;
    }
}


-(void)setUpNavgateView{
    UIView *navBar=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44+[UIApplication sharedApplication].statusBarFrame.size.height)];
    navBar.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:navBar];
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(10, [UIApplication sharedApplication].statusBarFrame.size.height, 44, 44);
    //    UIImage *icon = [UIImage imageWithIcon:@"fa-bars" backgroundColor:[UIColor clearColor] iconColor:RGB(254, 165, 60) andSize:CGSizeMake(10, 10)];
    //    [leftBtn setBackgroundImage:icon forState:UIControlStateNormal];
    NSString *barStr = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-bars"];
    leftBtn.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:32];
    [leftBtn setTitle:barStr forState:UIControlStateNormal];
    [leftBtn setTitleColor:Orange_Color forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftItemClick) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:leftBtn];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = 1;
    titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    titleLabel.text = @"集运天下";
    [navBar addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(navBar);
        make.centerY.equalTo(navBar).with.offset(STATUSBAR_HEIGHT/2);
    }];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(SCREEN_WIDTH-52, STATUSBAR_HEIGHT+7, 42, 30);
    rightBtn.titleLabel.font = BoldSystemFont(14);
    [rightBtn setTitle:@"定位" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [navBar addSubview:rightBtn];
    [rightBtn setBackgroundColor:Orange_Color];
    [rightBtn.layer setCornerRadius:4.0];
    [rightBtn.layer setShadowColor:[UIColor blackColor].CGColor];
    [rightBtn.layer setShadowOffset:CGSizeMake(1, 1)];
    [rightBtn.layer setShadowOpacity:0.1];
    //[rightBtn addTarget:self action:@selector(gotoLocateUser) forControlEvents:UIControlEventTouchUpInside];
}

-(void)leftItemClick{
    [self.view endEditing:YES];
    [[SliderViewController sharedSliderController] leftItemClick];
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
