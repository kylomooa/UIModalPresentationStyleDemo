//
//  BaseViewController.m
//  UIModalPresentationStyleDemo
//
//  Created by maoqiang on 2020/4/16.
//  Copyright © 2020 maoqiang. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()


@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.dismissBtn];
    [self.view addSubview:self.presentBtn];
}

-(void)dismissEvent{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)presentEvent{
    
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

-(UIButton *)presentBtn{
    if (nil == _presentBtn) {
        _presentBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 240, [UIScreen mainScreen].bounds.size.width - 40, 40)];
        _presentBtn.backgroundColor = [UIColor blackColor];
        [_presentBtn setTitle:@"presentBtn" forState:UIControlStateNormal];
        [_presentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_presentBtn addTarget:self action:@selector(presentEvent) forControlEvents:UIControlEventTouchUpInside];
        _presentBtn.layer.cornerRadius = 20;
        _presentBtn.layer.masksToBounds = YES;
    }
    return _presentBtn;
}


@end
