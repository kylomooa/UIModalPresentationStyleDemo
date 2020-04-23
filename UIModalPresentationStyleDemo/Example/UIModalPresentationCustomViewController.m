//
//  UIModalPresentationCustomViewController.m
//  UIModalPresentationStyleDemo
//
//  Created by maoqiang on 2020/4/16.
//  Copyright © 2020 maoqiang. All rights reserved.
//

#import "UIModalPresentationCustomViewController.h"
#import "UICustomViewControllerAnimatedTransitioning.h"
#import "UIModalPresentationCustomImageBrowserViewController.h"

@interface UIModalPresentationCustomViewController ()<UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) UIImageView *briefImageView;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation UIModalPresentationCustomViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.briefImageView];
    [self.view sendSubviewToBack:self.scrollView];
}

-(void)presentEvent{
    
    UIModalPresentationCustomImageBrowserViewController *vc = [[UIModalPresentationCustomImageBrowserViewController alloc]init];
    self.myTransitionView = self.briefImageView;
    vc.myTransitionView = vc.briefImageView;
    [self presentViewController:vc animated:YES completion:nil];
}

//MARK: - transition deleaget
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    UICustomViewControllerAnimatedTransitioning *zoom = [[UICustomViewControllerAnimatedTransitioning alloc]initWithTransitionType:UICustomViewControllerAnimatedTransitioningZoom];
    
    zoom.fromSubView = self.briefImageView;
    return zoom;
    
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[UICustomViewControllerAnimatedTransitioning alloc]initWithTransitionType:UICustomViewControllerAnimatedTransitioningDismiss];
}


- (UIImageView *)briefImageView {
    if (!_briefImageView) {
        _briefImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brief.jpg"]];
        _briefImageView.contentMode = UIViewContentModeScaleAspectFill;
        _briefImageView.frame = CGRectMake(100, myScreenHeight-100, [UIScreen mainScreen].bounds.size.width-200, [UIScreen mainScreen].bounds.size.width-200);
    }
    return _briefImageView;
}

-(UIScrollView *)scrollView{
    if (nil == _scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _scrollView.contentSize = CGSizeMake(myScreenWidth, 2*myScreenHeight);
        _scrollView.backgroundColor = [UIColor myBackgroundColor];
    }
    return _scrollView;
}

@end
