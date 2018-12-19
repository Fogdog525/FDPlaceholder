//
//  UIView+FDPlaceholder.m
//  FDPlaceholder
//
//  Created by 首牛科技 on 2018/12/19.
//  Copyright © 2018 ShouNew.com. All rights reserved.
//

#import "UIView+FDPlaceholder.h"
#import <objc/runtime.h>
@interface UIView()
@property(nonatomic,strong,readwrite)FDLoadingView *loadingView;
@property(nonatomic,strong,readwrite)FDErrorView *errorView;
@property(nonatomic,strong,readwrite)FDEmptyView *emptyView;
@end

@implementation UIView (FDPlaceholder)
- (void)setLoadingView:(FDLoadingView *)loadingView{
    [self willChangeValueForKey:NSStringFromSelector(@selector(loadingView))];
    objc_setAssociatedObject(self, @selector(loadingView), loadingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:NSStringFromSelector(@selector(loadingView))];
}
- (FDLoadingView *)loadingView{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)fd_showLoadingView{
    [self fd_showLoadingViewWithWords:nil offsetY:0];
}
- (void)fd_showLoadingViewWithWords:(NSString *)words offsetY:(CGFloat)offstY{
    if (self.errorView.superview) { [self.errorView removeFromSuperview]; }
    if (self.emptyView.superview) { [self.emptyView removeFromSuperview]; }
    if (!self.loadingView) {
        self.loadingView = [[FDLoadingView alloc]initWithFrame:self.bounds words:words offsetY:offstY];
        [self addSubview:self.loadingView];
        [self bringSubviewToFront:self.loadingView];
    }
    [self.loadingView startAnimating];
}
- (void)fd_showLoadingViewWithAttribuatedWords:(NSMutableAttributedString *)words offsetY:(CGFloat)offstY{
    if (self.errorView.superview) { [self.errorView removeFromSuperview]; }
    if (self.emptyView.superview) { [self.emptyView removeFromSuperview]; }
    if (!self.loadingView) {
        self.loadingView = [[FDLoadingView alloc]initWithFrame:self.bounds attributedWords:words offsetY:offstY];
        [self addSubview:self.loadingView];
        [self bringSubviewToFront:self.loadingView];
    }
     [self.loadingView startAnimating];
}
- (void)fd_hideLoadingView{
    if (self.loadingView) {
        [self.loadingView removeFromSuperview];
        self.loadingView = nil;
        [self.loadingView stopAnimating];
    }
}
- (void)setEmptyView:(FDEmptyView *)emptyView{
    [self willChangeValueForKey:NSStringFromSelector(@selector(emptyView))];
    objc_setAssociatedObject(self, @selector(emptyView), emptyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:NSStringFromSelector(@selector(emptyView))];
}
- (FDEmptyView *)emptyView{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)fd_showEmptyView{
     [self fd_showEmptyViewWithWords:nil image:nil offsetY:0];
}
- (void)fd_showEmptyViewWithWords:(NSString *)words image:(NSString *)image offsetY:(CGFloat)offsetY{
    if (self.loadingView.superview) { [self.loadingView removeFromSuperview]; }
    if (self.errorView.superview) { [self.errorView removeFromSuperview]; }
    if (!self.emptyView) {
        self.emptyView = [[FDEmptyView alloc]initWithFrame:self.bounds words:words image:image offsetY:offsetY];
        [self addSubview:self.emptyView];
        [self bringSubviewToFront:self.emptyView];
    }
}
- (void)fd_showEmptyViewWithAttributedWords:(NSMutableAttributedString *)words image:(NSString *)image offsetY:(CGFloat)offsetY{
    if (self.loadingView.superview) { [self.loadingView removeFromSuperview]; }
    if (self.errorView.superview) { [self.errorView removeFromSuperview]; }
    if (!self.emptyView) {
        self.emptyView = [[FDEmptyView alloc]initWithFrame:self.bounds attributedWords:words image:image offsetY:offsetY];
        [self addSubview:self.emptyView];
        [self bringSubviewToFront:self.emptyView];
    }
}
- (void)fd_hideEmptyView{
    if (self.emptyView) {
        [self.emptyView removeFromSuperview];
        self.emptyView = nil;
    }
}
- (void)setErrorView:(FDErrorView *)errorView{
    [self willChangeValueForKey:NSStringFromSelector(@selector(errorView))];
    objc_setAssociatedObject(self, @selector(errorView), errorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:NSStringFromSelector(@selector(errorView))];
}
- (FDErrorView *)errorView{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)fd_showErrorViewReloadAction:(ReloadActionBlock)action{
    [self fd_showErrorViewWithWords:nil image:nil reloadButton:nil offsetY:0 reloadAction:action];
}
- (void)fd_showErrorViewWithWords:(nullable NSString *)words
                            image:(nullable NSString *)image
                     reloadButton:(nullable UIButton *)button
                          offsetY:(CGFloat)offsetY
                     reloadAction:(ReloadActionBlock)action{
    if (self.loadingView.superview) { [self.loadingView removeFromSuperview]; }
    if (self.emptyView.superview) { [self.emptyView removeFromSuperview]; }
    if (!self.errorView) {
        self.errorView = [[FDErrorView alloc]initWithFrame:self.bounds words:words image:image reloadButton:button offsetY:offsetY reloadAction:action];
        [self addSubview:self.errorView];
        [self bringSubviewToFront:self.errorView];
    }
}
- (void)fd_showErrorViewWithAttributedWords:(nullable NSMutableAttributedString *)words
                                      image:(nullable NSString *)image
                               reloadButton:(nullable UIButton *)button
                                    offsetY:(CGFloat)offsetY
                               reloadAction:(ReloadActionBlock)action{
    if (self.loadingView.superview) { [self.loadingView removeFromSuperview]; }
    if (self.emptyView.superview) { [self.emptyView removeFromSuperview]; }
    if (!self.errorView) {
        self.errorView = [[FDErrorView alloc]initWithFrame:self.bounds attributedWords:words image:image reloadButton:button offsetY:offsetY reloadAction:action];
        [self addSubview:self.errorView];
        [self bringSubviewToFront:self.errorView];
    }
}
- (void)fd_hideErrorView{
    if (self.errorView) {
        [self.errorView removeFromSuperview];
        self.errorView = nil;
    }
}
@end

@interface FDLoadingView()
@property (nonatomic,weak)UIActivityIndicatorView *activityView;
@end

@implementation FDLoadingView
- (instancetype)initWithFrame:(CGRect)frame
                        words:(NSString *)words
                      offsetY:(CGFloat)offsetY{
    if (self = [super initWithFrame:frame]) {
        
        UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        activityView.center = CGPointMake(self.center.x, self.center.y + offsetY);
        self.activityView = activityView;
        [self addSubview:activityView];
        
        UILabel* loadingTipLabel = [[UILabel alloc]init];
        loadingTipLabel.numberOfLines = 1;
        loadingTipLabel.font = [UIFont systemFontOfSize:15];
        loadingTipLabel.textAlignment = NSTextAlignmentCenter;
        loadingTipLabel.text = words?words:@"正在加载...";
        [loadingTipLabel sizeToFit];
        loadingTipLabel.frame = CGRectMake((self.frame.size.width - loadingTipLabel.frame.size.width) * 0.5, CGRectGetMaxY(activityView.frame) + 10, loadingTipLabel.frame.size.width, loadingTipLabel.frame.size.height);
        [self addSubview:loadingTipLabel];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
              attributedWords:(NSMutableAttributedString *)words
                      offsetY:(CGFloat)offsetY{
    if (self = [super initWithFrame:frame]) {
        
        UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        activityView.color = [UIColor redColor];
        activityView.center = CGPointMake(self.center.x, self.center.y + offsetY);
        [self addSubview:activityView];
        
        UILabel* loadingTipLabel = [[UILabel alloc]init];
        loadingTipLabel.numberOfLines = 1;
        loadingTipLabel.font = [UIFont systemFontOfSize:15];
        loadingTipLabel.textAlignment = NSTextAlignmentCenter;
        NSMutableAttributedString *defaultAttribuatedString = [[NSMutableAttributedString alloc]initWithString:@"正在加载..."];
        loadingTipLabel.attributedText = words?words:defaultAttribuatedString;
        [loadingTipLabel sizeToFit];
        loadingTipLabel.frame = CGRectMake((self.frame.size.width - loadingTipLabel.frame.size.width) * 0.5, CGRectGetMaxY(activityView.frame) + 10, loadingTipLabel.frame.size.width, loadingTipLabel.frame.size.height);
        [self addSubview:loadingTipLabel];
    }
    return self;
}
- (void)startAnimating{
    [self.activityView startAnimating];
}
- (void)stopAnimating{
     [self.activityView stopAnimating];
}
@end

@implementation FDEmptyView
- (instancetype)initWithFrame:(CGRect)frame
                        words:(NSString *)words
                        image:(NSString *)image
                      offsetY:(CGFloat)offsetY{
    if (self = [super initWithFrame:frame]){
        
        UIImage *defaultImage = [UIImage imageNamed:image?image:@"DefaultEmpty"];
        UIImageView *noDataImageView = [[UIImageView alloc]initWithImage:defaultImage];
        noDataImageView.center = CGPointMake(self.center.x, self.center.y + offsetY);
        [self addSubview:noDataImageView];
        
        UILabel *noDataTipLabel = [[UILabel alloc]init];
        noDataTipLabel.numberOfLines = 0;
        noDataTipLabel.font = [UIFont systemFontOfSize:15];
        noDataTipLabel.textAlignment = NSTextAlignmentCenter;
        noDataTipLabel.textColor = [UIColor grayColor];
        noDataTipLabel.backgroundColor = [UIColor clearColor];
        noDataTipLabel.text = words?words:@"这里没有数据呢,\n赶紧弄出点动静吧~";
        [noDataTipLabel sizeToFit];
        noDataTipLabel.frame = CGRectMake(40, CGRectGetMaxY(noDataImageView.frame) + 10, self.bounds.size.width - 80, noDataTipLabel.frame.size.height);
        [self addSubview:noDataTipLabel];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
              attributedWords:(NSMutableAttributedString *)words
                        image:(NSString *)image
                      offsetY:(CGFloat)offsetY{
    if (self = [super initWithFrame:frame]){
        UIImage *emptyImage = [UIImage imageNamed:(image?image:@"DefaultEmpty")];
        UIImageView *noDataImageView = [[UIImageView alloc]initWithImage:emptyImage];
        noDataImageView.center = CGPointMake(self.center.x, self.center.y + offsetY);
        [self addSubview:noDataImageView];
        
        UILabel *noDataTipLabel = [[UILabel alloc]init];
        noDataTipLabel.numberOfLines = 0;
        noDataTipLabel.textAlignment = NSTextAlignmentCenter;
        noDataTipLabel.backgroundColor = [UIColor clearColor];
        NSMutableAttributedString *defaultAttribuatedString = [[NSMutableAttributedString alloc]initWithString:@"这里没有数据呢,赶紧弄出点动静吧~"];
        [defaultAttribuatedString addAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} range:NSMakeRange(0, defaultAttribuatedString.string.length)];
        noDataTipLabel.attributedText = words?words:defaultAttribuatedString;
        [noDataTipLabel sizeToFit];
        noDataTipLabel.frame = CGRectMake(40, CGRectGetMaxY(noDataImageView.frame) + 10, self.bounds.size.width - 80, noDataTipLabel.frame.size.height);
        [self addSubview:noDataTipLabel];
    }
    return self;
}
@end

@interface FDErrorView()
@property (nonatomic,copy)ReloadActionBlock reloadActionBlock;
@end
@implementation FDErrorView
- (instancetype)initWithFrame:(CGRect)frame
                        words:(NSString *)words
                        image:(NSString *)image
                 reloadButton:(UIButton *)button
                      offsetY:(CGFloat)offsetY
                 reloadAction:(ReloadActionBlock)action{
    if (self = [super initWithFrame:frame]) {
       
        UIImage *defaultImage = [UIImage imageNamed:image?image:@"DefaultError"];
        UIImageView *errorImageView = [[UIImageView alloc]initWithImage:defaultImage];
        errorImageView.center = CGPointMake(self.center.x, self.center.y + offsetY);
        [self addSubview:errorImageView];
        
        UILabel *errorTipLabel = [[UILabel alloc]init];
        errorTipLabel.numberOfLines = 0;
        errorTipLabel.font = [UIFont systemFontOfSize:15];
        errorTipLabel.textAlignment = NSTextAlignmentCenter;
        errorTipLabel.textColor = [UIColor grayColor];
        errorTipLabel.backgroundColor = [UIColor clearColor];
        errorTipLabel.text = words?words:@"似乎与网络失去了连接~~";
        [errorTipLabel sizeToFit];
        errorTipLabel.frame = CGRectMake(40, CGRectGetMaxY(errorImageView.frame) + 10, self.bounds.size.width - 80, errorTipLabel.frame.size.height);
        [self addSubview:errorTipLabel];
        
        if (!button) {
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"点击重新加载" forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:15];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        button.backgroundColor = [UIColor clearColor];
        button.layer.cornerRadius = 15;
        button.layer.masksToBounds = YES;
        button.layer.borderColor = [UIColor redColor].CGColor;
        button.layer.borderWidth = 1;
        button.frame = CGRectMake((self.frame.size.width - 120) * 0.5, CGRectGetMaxY(errorTipLabel.frame) + 10, 120, 30);
        [button addTarget:self action:@selector(_clickReloadButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        self.reloadActionBlock = action;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
              attributedWords:(NSMutableAttributedString *)words
                        image:(NSString *)image
                 reloadButton:(UIButton *)button
                      offsetY:(CGFloat)offsetY
                 reloadAction:(ReloadActionBlock)action{
    if (self = [super initWithFrame:frame]) {
        
        UIImage *defaultImage = [UIImage imageNamed:(image?image:@"DefaultError")];
        UIImageView *errorImageView = [[UIImageView alloc]initWithImage:defaultImage];
        errorImageView.center = CGPointMake(self.center.x, self.center.y + offsetY);
        [self addSubview:errorImageView];
        
        UILabel *errorTipLabel = [[UILabel alloc]init];
        errorTipLabel.numberOfLines = 0;
        errorTipLabel.textAlignment = NSTextAlignmentCenter;
        errorTipLabel.backgroundColor = [UIColor clearColor];
        NSMutableAttributedString *defaultAttribuatedString = [[NSMutableAttributedString alloc]initWithString:@"似乎与网络失去了连接~~"];
        [defaultAttribuatedString addAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} range:NSMakeRange(0, defaultAttribuatedString.string.length)];
        errorTipLabel.attributedText = words?words:defaultAttribuatedString;
        [errorTipLabel sizeToFit];
        errorTipLabel.frame = CGRectMake(40, CGRectGetMaxY(errorImageView.frame) + 10, self.bounds.size.width - 80, errorTipLabel.frame.size.height);
        [self addSubview:errorTipLabel];
        
        if (!button) {
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"点击重新加载" forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:15];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        button.backgroundColor = [UIColor clearColor];
        button.layer.cornerRadius = 15;
        button.layer.masksToBounds = YES;
        button.layer.borderColor = [UIColor redColor].CGColor;
        button.layer.borderWidth = 1;
        button.frame = CGRectMake((self.frame.size.width - 120) * 0.5, CGRectGetMaxY(errorTipLabel.frame) + 10, 120, 30);
        [button addTarget:self action:@selector(_clickReloadButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        self.reloadActionBlock = action;
    }
    return self;
}
- (void)_clickReloadButton:(UIButton *)sender{
    
    if (self.reloadActionBlock) {
        self.reloadActionBlock();
    }
}
@end



