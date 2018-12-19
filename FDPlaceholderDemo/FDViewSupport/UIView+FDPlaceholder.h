//
//  UIView+FDPlaceholder.h
//  FDPlaceholder
//
//  Created by 首牛科技 on 2018/12/19.
//  Copyright © 2018 ShouNew.com. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ReloadActionBlock)(void);
@interface UIView (FDPlaceholder)
- (void)fd_showLoadingView;
- (void)fd_showLoadingViewWithWords:(nullable NSString *)words offsetY:(CGFloat)offstY;
- (void)fd_showLoadingViewWithAttribuatedWords:(nullable NSMutableAttributedString *)words offsetY:(CGFloat)offstY;
- (void)fd_hideLoadingView;

- (void)fd_showEmptyView;
- (void)fd_showEmptyViewWithWords:(nullable NSString *)words
                            image:(nullable NSString *)image
                          offsetY:(CGFloat)offsetY;
- (void)fd_showEmptyViewWithAttributedWords:(nullable NSMutableAttributedString *)words
                                      image:(nullable NSString *)image
                                    offsetY:(CGFloat)offsetY;
- (void)fd_hideEmptyView;

- (void)fd_showErrorViewReloadAction:(ReloadActionBlock)action;
- (void)fd_showErrorViewWithWords:(nullable NSString *)words
                            image:(nullable NSString *)image
                     reloadButton:(nullable UIButton *)button
                          offsetY:(CGFloat)offsetY
                     reloadAction:(ReloadActionBlock)action;
- (void)fd_showErrorViewWithAttributedWords:(nullable NSMutableAttributedString *)words
                                      image:(nullable NSString *)image
                               reloadButton:(nullable UIButton *)button
                                    offsetY:(CGFloat)offsetY
                               reloadAction:(ReloadActionBlock)action;
- (void)fd_hideErrorView;
@end

@interface FDLoadingView:UIView
- (instancetype)initWithFrame:(CGRect)frame
                        words:(nullable NSString *)words
                      offsetY:(CGFloat)offsetY;
- (instancetype)initWithFrame:(CGRect)frame
              attributedWords:(nullable NSMutableAttributedString *)words
                      offsetY:(CGFloat)offsetY;
- (void)startAnimating;
- (void)stopAnimating;
@end

@interface FDEmptyView:UIView
- (instancetype)initWithFrame:(CGRect)frame
                        words:(nullable NSString *)words
                        image:(nullable NSString *)image
                      offsetY:(CGFloat)offsetY;
- (instancetype)initWithFrame:(CGRect)frame
              attributedWords:(nullable NSMutableAttributedString *)words
                        image:(nullable NSString *)image
                      offsetY:(CGFloat)offsetY;
@end

@interface FDErrorView:UIView
- (instancetype)initWithFrame:(CGRect)frame
                        words:(nullable NSString *)words
                        image:(nullable NSString *)image
                 reloadButton:(nullable UIButton *)button
                      offsetY:(CGFloat)offsetY
                 reloadAction:(ReloadActionBlock)action;
- (instancetype)initWithFrame:(CGRect)frame
              attributedWords:(nullable NSMutableAttributedString *)words
                        image:(nullable NSString *)image
                 reloadButton:(nullable UIButton *)button
                      offsetY:(CGFloat)offsetY
                 reloadAction:(ReloadActionBlock)action;
@end

