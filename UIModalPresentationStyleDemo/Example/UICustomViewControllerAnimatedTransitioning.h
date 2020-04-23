//
//  UICustomViewControllerAnimatedTransitioning.h
//  UIModalPresentationStyleDemo
//
//  Created by maoqiang on 2020/4/16.
//  Copyright © 2020 maoqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    UICustomViewControllerAnimatedTransitioningZoom,
    UICustomViewControllerAnimatedTransitioningDismiss,
} UICustomViewControllerAnimatedTransitioningType;

@interface UICustomViewControllerAnimatedTransitioning : NSObject <UIViewControllerAnimatedTransitioning>

- (instancetype)initWithTransitionType:(UICustomViewControllerAnimatedTransitioningType)type;
@property (nonatomic, weak) UIView *fromSubView;


@end

NS_ASSUME_NONNULL_END
