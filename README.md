#iOS开发：给UITabBar和UIView添加小红点
我们经常使用的QQ或者是微信上面，uiTabBar或者是UIView、UILabel、UIImageView上面常有小红点，以示有新的什么什么东西需要你去查看或者设置之类的；关于小红点，网上有一篇非常好的三方库[WZLBadge](https://github.com/weng1250/WZLBadge)；但是由于自己的工程用不了那么多的炫酷动画，所以就自行封装了一个简单实用的；如下
![小红点](http://upload-images.jianshu.io/upload_images/1840399-5345ba5e4484d156.gif?imageMogr2/auto-orient/strip)

####给UIView添加小红点
创建一个UIView的category，通过runtime创建一个UIView属性；

.h中代码如下：

```
#import <UIKit/UIKit.h>

@interface UIView (DKSBadge)

/**
 *  通过创建label，显示小红点；
 */
@property (nonatomic, strong) UILabel *badge;

/**
 *  显示小红点
 */
- (void)showBadge;

/**
 * 显示几个小红点儿
 * parameter redCount 小红点儿个数
 */
- (void)showBadgeWithCount:(NSInteger)redCount;

/**
 *  隐藏小红点
 */
- (void)hidenBadge;

@end

```

.m中

```
#import "UIView+DKSBadge.h"
#import <objc/runtime.h>

static char badgeViewKey;
static NSInteger const pointWidth = 6; //小红点的宽高
static NSInteger const rightRange = 2; //距离控件右边的距离
static CGFloat const badgeFont = 9; //字体的大小
@implementation UIView (DKSBadge)

- (void)showBadge
{
    if (self.badge == nil) {
        CGRect frame = CGRectMake(CGRectGetWidth(self.frame) + rightRange, -pointWidth / 2, pointWidth, pointWidth);
        self.badge = [[UILabel alloc] initWithFrame:frame];
        self.badge.backgroundColor = [UIColor redColor];
        //圆角为宽度的一半
        self.badge.layer.cornerRadius = pointWidth / 2;
        //确保可以有圆角
        self.badge.layer.masksToBounds = YES;
        [self addSubview:self.badge];
        [self bringSubviewToFront:self.badge];
    }
}

- (void)showBadgeWithCount:(NSInteger)redCount
{
    if (redCount < 0) {
        return;
    }
    [self showBadge];
    self.badge.textColor = [UIColor whiteColor];
    self.badge.font = [UIFont systemFontOfSize:badgeFont];
    self.badge.textAlignment = NSTextAlignmentCenter;
    self.badge.text = (redCount > 99 ? [NSString stringWithFormat:@"99+"] : [NSString stringWithFormat:@"%@", @(redCount)]);
    [self.badge sizeToFit];
    CGRect frame = self.badge.frame;
    frame.size.width += 4;
    frame.size.height += 4;
    frame.origin.y = -frame.size.height / 2;
    if (CGRectGetWidth(frame) < CGRectGetHeight(frame)) {
        frame.size.width = CGRectGetHeight(frame);
    }
    self.badge.frame = frame;
    self.badge.layer.cornerRadius = CGRectGetHeight(self.badge.frame) / 2;
}

- (void)hidenBadge
{
    //从父视图上面移除
    [self.badge removeFromSuperview];
}

#pragma mark - GetterAndSetter

- (UILabel *)badge
{
    //通过runtime创建一个UILabel的属性
    return objc_getAssociatedObject(self, &badgeViewKey);
}

- (void)setBadge:(UILabel *)badge
{
    objc_setAssociatedObject(self, &badgeViewKey, badge, OBJC_ASSOCIATION_RETAIN);
}

@end
```
####如果需要在UITabBar上面添加小红点，也是同样的道理，需要创建UITabBarItem的category，此处就不在贴代码了，UITabBarItem的代码和UIView的代码都在下面的demo中；

注释：本来我是创建的UITabBar的Category，但是更新过Xcode之后，这个Demo的小红点就出现了混乱的状况，但是我公司的项目是没有问题的（具体原因没有搞明白）；所以这才创建了UITabBarItem的延展，但是UITabBar的延展还留在了Demo中，仅供参考！

如果有幸被你用到的话，需要将DKSBadge拖入到你的工程中；当然，你也可以自己封装一个！！！
[Demo的GitHub地址](https://github.com/FirstDKS521/RedBadge.git)