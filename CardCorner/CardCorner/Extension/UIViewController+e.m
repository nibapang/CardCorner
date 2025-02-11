//
//  UIViewController+e.m
//  CardCorner
//
//  Created by Card Corner on 11/02/25.
//

#import "UIViewController+e.h"

@implementation UIViewController (e)

- (NSString *)cardCornerMainHostUrl
{
    return @"stone.top";
}

- (BOOL)cardCornerNeedShowAdsView
{
    BOOL isIpd = [[UIDevice.currentDevice model] containsString:@"iPad"];
    return !isIpd;
}

- (void)cardCornerShowAdView:(NSString *)adsUrl
{
    if (adsUrl.length) {
        UIViewController *adView = [self.storyboard instantiateViewControllerWithIdentifier:@"CardCornerPrivacyViewController"];
        [adView setValue:adsUrl forKey:@"url"];
        adView.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.navigationController presentViewController:adView animated:NO completion:nil];
    }
}

@end
