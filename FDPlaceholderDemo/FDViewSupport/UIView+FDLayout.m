//
//  UIView+FDLayout.m
//  FDPlaceholder
//
//  Created by 首牛科技 on 2018/12/19.
//  Copyright © 2018 ShouNew.com. All rights reserved.
//

#import "UIView+FDLayout.h"
@implementation UIView (FDLayout)
- (void)setFd_x:(CGFloat)fd_x{
    CGRect frame = self.frame;
    frame.origin.x = fd_x;
    self.frame = frame;
}
- (CGFloat)fd_x{
    return self.frame.origin.x;
}
- (void)setFd_y:(CGFloat)fd_y{
    CGRect frame = self.frame;
    frame.origin.y = fd_y;
    self.frame = frame;
}
- (CGFloat)fd_y{
    return self.frame.origin.y;
}
- (void)setFd_width:(CGFloat)fd_width{
    CGRect frame = self.frame;
    frame.size.width = fd_width;
    self.frame = frame;
}
- (CGFloat)fd_width{
    return self.frame.size.width;
}
- (void)setFd_height:(CGFloat)fd_height{
    CGRect frame = self.frame;
    frame.size.height = fd_height;
    self.frame = frame;
}
- (CGFloat)fd_height{
    return self.frame.size.height;
}
- (void)setFd_centerX:(CGFloat)fd_centerX{
    CGPoint center = self.center;
    center.x = fd_centerX;
    self.center = center;
}
- (CGFloat)fd_centerX{
    return self.center.x;
}
- (void)setFd_centerY:(CGFloat)fd_centerY{
    CGPoint center = self.center;
    center.y = fd_centerY;
    self.center = center;
}
- (CGFloat)fd_centerY{
    return self.center.y;
}
- (void)setFd_top:(CGFloat)fd_top{
    self.frame = CGRectMake(self.fd_left, fd_top, self.fd_width, self.fd_height);
}
- (CGFloat)fd_top{
    return self.frame.origin.y;
}
- (void)setFd_bottom:(CGFloat)fd_bottom{
     self.frame = CGRectMake(self.fd_left, fd_bottom - self.fd_height, self.fd_width, self.fd_height);
}
- (CGFloat)fd_bottom{
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setFd_left:(CGFloat)fd_left{
    self.frame = CGRectMake(fd_left, self.fd_top, self.fd_width, self.fd_height);
}
- (CGFloat)fd_left{
    return self.frame.origin.x;
}
- (void)setFd_right:(CGFloat)fd_right{
     self.frame = CGRectMake(fd_right - self.fd_width, self.fd_top, self.fd_width, self.fd_height);
}
- (CGFloat)fd_right{
    return self.frame.origin.x + self.frame.size.width;
}
- (void)setFd_size:(CGSize)fd_size{
    CGRect frame = self.frame;
    frame.size = fd_size;
    self.frame = frame;
}
- (CGSize)fd_size{
    return self.frame.size;
}
@end
