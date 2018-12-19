<font color=#6A5ACD size=3>
  
# FDPlaceholder
 - FDPlaceholder 能快速地给UIView或UIScrollView添加占位视图(比如加载视图、空数据视图、加载出错视图等)。调用简单，可定制程度高。
### 效果图


### 如何使用
 - 拖入文件夹FDViewSupport,并导入头文件"FDViewSupport.h"。
 - 简洁的API调用:(注:使用默认的图片和文字提示)
  
   ``` objc
   //显示loading
   - (void)fd_showLoadingView;
   //隐藏loading
   - (void)fd_hideLoadingView;
   
   //显示error
    - (void)fd_showErrorViewReloadAction:(ReloadActionBlock)action;
   //隐藏error
   - (void)fd_hideErrorView;
   
   //显示empty
   - (void)fd_showEmptyView;
   //隐藏empty
   - (void)fd_hideEmptyView;
   ```
 - 如果用户不想使用默认的图片和文字，FDViewPlaceholder还额外提供了其他接口给用户DIY
 
  ``` objc
  
  //loading
   - (void)fd_showLoadingViewWithWords:(nullable NSString *)words offsetY:(CGFloat)offstY;
   - (void)fd_showLoadingViewWithAttribuatedWords:(nullable NSMutableAttributedString *)words offsetY:(CGFloat)offstY;
  
  //empty
   - (void)fd_showEmptyViewWithWords:(nullable NSString *)words
                            image:(nullable NSString *)image
                          offsetY:(CGFloat)offsetY;
   - (void)fd_showEmptyViewWithAttributedWords:(nullable NSMutableAttributedString *)words
                                      image:(nullable NSString *)image
                                    offsetY:(CGFloat)offsetY;
    //error                                
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
  ```
 - 后续会不断更新其他功能。
  
 - 您在使用过程中出现错误或有好的建议，请给我issues提出来。
</font>
