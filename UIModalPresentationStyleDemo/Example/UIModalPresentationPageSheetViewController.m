//
//  UIModalPresentationPageSheetViewController.m
//  UIModalPresentationStyleDemo
//
//  Created by maoqiang on 2020/4/16.
//  Copyright © 2020 maoqiang. All rights reserved.
//

#import "UIModalPresentationPageSheetViewController.h"

@interface UIModalPresentationPageSheetViewController ()

@end

@implementation UIModalPresentationPageSheetViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationPageSheet;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
