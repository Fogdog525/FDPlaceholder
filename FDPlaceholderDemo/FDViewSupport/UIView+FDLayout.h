//
//  UIView+FDLayout.h
//  FDPlaceholder
//
//  Created by 首牛科技 on 2018/12/19.
//  Copyright © 2018 ShouNew.com. All rights reserved.
//

/**********UIView布局的拓展***********/
#import <UIKit/UIKit.h>
@interface UIView (FDLayout)
@property(nonatomic)CGFloat fd_x;
@property(nonatomic)CGFloat fd_y;
@property(nonatomic)CGFloat fd_width;
@property(nonatomic)CGFloat fd_height;
@property(nonatomic)CGFloat fd_centerX;
@property(nonatomic)CGFloat fd_centerY;
@property(nonatomic)CGFloat fd_top;
@property(nonatomic)CGFloat fd_bottom;
@property(nonatomic)CGFloat fd_left;
@property(nonatomic)CGFloat fd_right;
@property(nonatomic)CGSize  fd_size;
@end
