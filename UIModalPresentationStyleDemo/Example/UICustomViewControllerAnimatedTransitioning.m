//
//  UICustomViewControllerAnimatedTransitioning.m
//  UIModalPresentationStyleDemo
//
//  Created by maoqiang on 2020/4/16.
//  Copyright © 2020 maoqiang. All rights reserved.
//

#import "UICustomViewControllerAnimatedTransitioning.h"

@interface UICustomViewControllerAnimatedTransitioning ()
@property (nonatomic, assign) UICustomViewControllerAnimatedTransitioningType type;
@end

@implementation UICustomViewControllerAnimatedTransitioning

- (instancetype)initWithTransitionType:(UICustomViewControllerAnimatedTransitioningType)type {
    self = [super init];
    if (self) {
        self.type = type;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    switch (self.type) {
        case UICustomViewControllerAnimatedTransitioningZoom:
            [self zoomTransition:transitionContext];
            break;
            
        case UICustomViewControllerAnimatedTransitioningDismiss:
            [self dismissTransition:transitionContext];
            break;
        default:
            break;
    }
}

- (void)zoomTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.view.alpha = 0;
    UIView *containerVier = [transitionContext containerView];
    [containerVier addSubview:toVC.view];
    
    UIView *snapView = [self.fromSubView snapshotViewAfterScreenUpdates:NO];
    
    [containerVier addSubview:snapView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        CGFloat scale = [UIScreen mainScreen].bounds.size.width/snapView.frame.size.width;
        
        snapView.transform = CGAffineTransformMakeScale(scale,scale);
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        [snapView removeFromSuperview];
        toVC.view.alpha = 1;
        
    }];
    
}

- (void)dismissTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//
//    UIView *containerVier = [transitionContext containerView];
//
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromVC.view.frame = CGRectMake(0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        
    }];
}



@end
