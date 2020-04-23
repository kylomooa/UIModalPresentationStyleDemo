//
//  ViewController.m
//  UIModalPresentationStyleDemo
//
//  Created by maoqiang on 2020/4/16.
//  Copyright © 2020 maoqiang. All rights reserved.
//
/**
 typedefNS_ENUM(NSInteger, UIModalPresentationStyle) {
       UIModalPresentationFullScreen =0,//由下到上,全屏覆盖
       UIModalPresentationPageSheet,//在portrait时是FullScreen，在landscape时和FormSheet模式一样。
       UIModalPresentationFormSheet,// 会将窗口缩小，使之居于屏幕中间。在portrait和landscape下都一样，但要注意landscape下如果软键盘出现，窗口位置会调整。
       UIModalPresentationCurrentContext,//这种模式下，presented VC的弹出方式和presenting VC的父VC的方式相同。
       UIModalPresentationCustom,//自定义视图展示风格,由一个自定义演示控制器和一个或多个自定义动画对象组成。符合UIViewControllerTransitioningDelegate协议。使用视图控制器的transitioningDelegate设定您的自定义转换。
       UIModalPresentationOverFullScreen,//如果视图没有被填满,底层视图可以透过
       UIModalPresentationOverCurrentContext,//视图全部被透过
       UIModalPresentationPopover,
       UIModalPresentationNone ,
 };
 */

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.estimatedRowHeight = 100;
    }
    return _tableView;
}

-(NSArray *)dataArray{
    _dataArray = @[@{@"title":@"UIModalPresentationFullScreen",
                     @"detail":@"由下到上,全屏覆盖。",
                    },
                   @{@"title":@"UIModalPresentationPageSheet",
                    @"detail":@"在landscape时是FullScreen，在portrait时和FormSheet模式一样。",
                   },
                   @{@"title":@"UIModalPresentationFormSheet",
                    @"detail":@"会将窗口缩小，使之居于屏幕中间。在portrait和landscape下都一样，但要注意landscape下如果软键盘出现，窗口位置会调整。",
                   },
                   @{@"title":@"UIModalPresentationCurrentContext",
                    @"detail":@"这种模式下，presented VC的弹出方式和presenting VC的父VC的方式相同",
                   },
                   @{@"title":@"UIModalPresentationCustom",
                    @"detail":@"自定义视图展示风格,由一个自定义演示控制器和一个或多个自定义动画对象组成。符合UIViewControllerTransitioningDelegate协议。使用视图控制器的transitioningDelegate设定您的自定义转换。",
                   },
                   @{@"title":@"UIModalPresentationOverFullScreen",
                    @"detail":@"如果视图没有被填满,底层视图可以透过",
                   },
                   @{@"title":@"UIModalPresentationOverCurrentContext",
                    @"detail":@"视图全部被透过",
                   },
                   @{@"title":@"UIModalPresentationPopover",
                    @"detail":@"",
                   },
                   @{@"title":@"UIModalPresentationNone",
                    @"detail":@"",
                   },
    ];
    return _dataArray;
}

//MARK: - tableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    if (indexPath.row < self.dataArray.count) {
        NSDictionary *dict = self.dataArray[indexPath.row];
        cell.textLabel.text = dict[@"title"];
        cell.detailTextLabel.text = dict[@"detail"];
        cell.detailTextLabel.numberOfLines = 0;
    }
    return cell;
}

//MARK: - tableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row < self.dataArray.count) {
        NSDictionary *dict = self.dataArray[indexPath.row];
        NSString *vcStr = dict[@"title"];
        UIViewController *vc = [[NSClassFromString([NSString stringWithFormat:@"%@ViewController",vcStr]) alloc]init];
        if (vc) {
            
            [self presentViewController:vc animated:YES completion:nil];
        }
    }
}

@end
