#import "BlurView.h"


@implementation BlurView {
  UIVisualEffectView *_visualEffectView;
    UIBlurEffect * blurEffect;
    NSNumber *localBlurAmount;
}

- (void)setBlurType:(NSString *)blurType
{
  if (_visualEffectView) {
    [_visualEffectView removeFromSuperview];
  }
  
  self.clipsToBounds = true;
  if ([blurType isEqual: @"xlight"]) {
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
  } else if ([blurType isEqual: @"light"]) {
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
  } else if ([blurType isEqual: @"dark"]) {
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
  } else {
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
  }

    dispatch_async(dispatch_get_main_queue(), ^{
        _visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        _visualEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _visualEffectView.frame = self.bounds;
        [self insertSubview:_visualEffectView atIndex:0];
    });
}

- (void)setBlurAmount:(NSNumber *)blurAmount
{
    localBlurAmount = blurAmount;
}

@end
