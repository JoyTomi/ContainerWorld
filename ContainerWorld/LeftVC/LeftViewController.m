//
//  LeftViewController.m
//  LeftRightSlider
//
//  Created by JoyTomi on 16/4/14.
//  Copyright © 2016年 JoyTomi. All rights reserved.
//


#import "LeftViewController.h"
#import "SliderViewController.h"
#import "UIImage+FontAwesome.h"
#import "NSString+FontAwesome.h"

@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)NSArray *imageNameArray;

@end

@implementation LeftViewController

-(NSArray *)titleArray{
    if (!_titleArray) {
        _titleArray = @[@"首页",@"我的足迹",@"消息",@"客服热线",@"APP使用指南",@"意见反馈"];
    }
    return _titleArray;
}

-(NSArray *)imageNameArray{
    if (!_imageNameArray) {
        _imageNameArray = @[@"fa-home",@"fa-eye",@"fa-bell",@"fa-phone",@"fa-clipboard",@"fa-question-circle"];
    }
    return _imageNameArray;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = RGB(14, 144, 210);
    [self setUpTableView];
    // Do any additional setup after loading the view.
}


-(void)setUpBackgroudImage{
    UIImageView *imgV=[[UIImageView alloc] initWithFrame:self.view.bounds];
    [imgV setImage:[UIImage imageNamed:@"3333"]];
    [self.view addSubview:imgV];
}

-(void)setUpTableView{
    UITableView *tableV=[[UITableView alloc] initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT, JRightSContentOffset, SCREEN_HEIGHT - STATUSBAR_HEIGHT - 50)];
    tableV.backgroundColor=RGB(14, 144, 210);
    tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableV.delegate=self;
    tableV.dataSource=self;
    [self.view addSubview:tableV];
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT + GetViewHeight(tableV), GetViewWidth(tableV), SCREEN_HEIGHT - GetViewHeight(tableV) - STATUSBAR_HEIGHT)];
    bottomView.backgroundColor = RGB(254, 165, 60);
    [self.view addSubview:bottomView];
    
    UIImageView *signOutImageView = [[UIImageView alloc]initWithImage:[UIImage imageWithIcon:@"fa-exchange" backgroundColor:[UIColor clearColor] iconColor:[UIColor whiteColor] andSize:CGSizeMake(30, 30)]];
    signOutImageView.frame = CGRectMake(16, GetViewHeight(bottomView)/4, GetViewHeight(bottomView)/2, GetViewHeight(bottomView)/2);
    [bottomView addSubview:signOutImageView];
    UIButton *changeId = [[UIButton alloc]initWithFrame:bottomView.bounds];
    [changeId setTitle:@"切换身份" forState:UIControlStateNormal];
    [changeId setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    changeId.titleLabel.font = systemFont(16);
    [bottomView addSubview:changeId];
    [changeId addTarget:self action:@selector(gotoChangeId) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 退出
-(void)gotoChangeId{
    if ([[UserDefaults objectForKey:@"Role"] isEqualToString:@"1"]) {
        [UserDefaults setObject:@"0" forKey:@"Role"];
    }else{
        [UserDefaults setObject:@"1" forKey:@"Role"];
    }
    
    [[SliderViewController sharedSliderController] showContentControllerWithModel:@"MainViewController"];
    [[SliderViewController sharedSliderController].MainVC viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID=@"cellID";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    
    if(cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.backgroundColor=[UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    if (indexPath.row == 0) {
        cell.imageView.image = [UIImage imageWithIcon:@"fa-user" backgroundColor:[UIColor clearColor] iconColor:[UIColor whiteColor] andSize:CGSizeMake(50, 50)];
        cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text= @"姓名";
    }else{
        UIImage *titleImage = [UIImage imageWithIcon:self.imageNameArray[indexPath.row - 1] backgroundColor:[UIColor clearColor] iconColor:[UIColor whiteColor] andSize:CGSizeMake(25, 25)];
        cell.textLabel.text = self.titleArray[indexPath.row-1];
        cell.imageView.image = titleImage;
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count + 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 100;
    }else{
        return 50;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            if ([UserDefaults objectForKey:@"PhoneNo"] == nil) {
                [[SliderViewController sharedSliderController] showContentNextControllerWithJModel:@"LoginViewController"];
            }else{
                [[SliderViewController sharedSliderController] showContentControllerWithModel:@"PersonalInfoViewController"];
            }
        }
            break;
        case 1:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"MainViewController"];
            break;
        case 2:
        {
            if ([UserDefaults objectForKey:@"PhoneNo"] == nil) {
                [[SliderViewController sharedSliderController] showContentNextControllerWithJModel:@"LoginViewController"];
            }else{
                if ([[UserDefaults objectForKey:@"Role"] isEqualToString:@"0"]) {
                    [[SliderViewController sharedSliderController] showContentControllerWithModel:@"MyRecordViewController"];
                }else{
                    [[SliderViewController sharedSliderController] showContentControllerWithModel:@"MySRecordViewController"];
                }
            }
            
        }
            break;
        case 3:{
            if ([UserDefaults objectForKey:@"PhoneNo"] == nil) {
                [[SliderViewController sharedSliderController] showContentNextControllerWithJModel:@"LoginViewController"];
            }else{
                [[SliderViewController sharedSliderController] showContentControllerWithModel:@"MessageViewController"];
            }
        }
            break;
        case 4:
            //            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"HotLineViewController"];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:021-56575237"]];
            break;
        case 5:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"ProtocolViewController"];
            break;
        case 6:{
            if ([UserDefaults objectForKey:@"PhoneNo"] == nil) {
                [[SliderViewController sharedSliderController] showContentNextControllerWithJModel:@"LoginViewController"];
            }else{
                [[SliderViewController sharedSliderController] showContentControllerWithModel:@"FeedBackViewController"];
            }
        }
            break;
        default:
            break;
    }
}

@end
