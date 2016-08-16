//
//  luochenxun (luochenxun@foxmail.com)
//
//  Created by luochenxun on 2015-09-02.
//  Copyright (c) 2015年 PinAgn. All rights reserved.
//

#import "PAFFRefreshAutoNormalFooter.h"

@interface PAFFRefreshAutoNormalFooter ()

@property(weak, nonatomic) UIActivityIndicatorView *loadingView;

@end

@implementation PAFFRefreshAutoNormalFooter

#pragma mark - 懒加载子控件
- (UIActivityIndicatorView *)loadingView {
  if (!_loadingView) {
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc]
        initWithActivityIndicatorStyle:self.activityIndicatorViewStyle];
    loadingView.hidesWhenStopped = YES;
    [self addSubview:_loadingView = loadingView];
  }
  return _loadingView;
}

- (void)setActivityIndicatorViewStyle:
        (UIActivityIndicatorViewStyle)activityIndicatorViewStyle {
  _activityIndicatorViewStyle = activityIndicatorViewStyle;
  
  self.loadingView = nil;
  [self setNeedsLayout];
}


#pragma makr - 重写父类的方法
- (void)prepare {
  [super prepare];
  
  self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
}

- (void)placeSubviews {
  [super placeSubviews];
  
  // 圈圈
  CGFloat arrowCenterX = self.mj_w * 0.5;
  if (!self.isRefreshingTitleHidden) {
    arrowCenterX -= 100;
  }
  CGFloat arrowCenterY = self.mj_h * 0.5;
  self.loadingView.center = CGPointMake(arrowCenterX, arrowCenterY);
}

- (void)setState:(PAFFRefreshState)state {
  PAFFRefreshCheckState
  
      // 根据状态做事情
      if (state == PAFFRefreshStateNoMoreData ||
          state == PAFFRefreshStateIdle) {
    [self.loadingView stopAnimating];
  }
  else if (state == PAFFRefreshStateRefreshing) {
    [self.loadingView startAnimating];
    }
}

@end