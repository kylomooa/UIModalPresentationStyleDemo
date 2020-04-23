//
//  UIModalPresentationCustomImageBrowserViewController.m
//  UIModalPresentationStyleDemo
//
//  Created by maoqiang on 2020/4/23.
//  Copyright © 2020 maoqiang. All rights reserved.
//

#import "UIModalPresentationCustomImageBrowserViewController.h"

@interface UIModalPresentationCustomImageBrowserViewController ()
@property (nonatomic, strong) UIButton *dismissBtn;
@end

@implementation UIModalPresentationCustomImageBrowserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.briefImageView];
    
    [self.view addSubview:self.dismissBtn];

}

-(void)dismissEvent{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIImageView *)briefImageView {
    if (!_briefImageView) {
        _briefImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brief.jpg"]];
        _briefImageView.contentMode = UIViewContentModeScaleAspectFill;
        _briefImageView.frame = CGRectMake(0, 0, myScreenWidth, myScreenWidth);
    }
    return _briefImageView;
}

-(UIButton *)dismissBtn{
    if (nil == _dismissBtn) {
        _dismissBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 300, [UIScreen mainScreen].bounds.size.width - 40, 40)];
        _dismissBtn.backgroundColor = [UIColor blackColor];
        [_dismissBtn setTitle:@"dismissBtn" forState:UIControlStateNormal];
        [_dismissBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_dismissBtn addTarget:self action:@selector(dismissEvent) forControlEvents:UIControlEventTouchUpInside];
        _dismissBtn.layer.cornerRadius = 20;
        _dismissBtn.layer.masksToBounds = YES;
    }
    return _dismissBtn;
}
@end
