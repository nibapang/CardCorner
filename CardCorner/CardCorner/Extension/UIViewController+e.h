//
//  UIViewController+e.h
//  CardCorner
//
//  Created by Card Corner on 11/02/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (e)
- (NSString *)cardCornerMainHostUrl;
- (BOOL)cardCornerNeedShowAdsView;
- (void)cardCornerShowAdView:(NSString *)adsUrl;
@end

NS_ASSUME_NONNULL_END
