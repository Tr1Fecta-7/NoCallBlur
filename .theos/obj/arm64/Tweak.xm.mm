#line 1 "Tweak.xm"
@interface SBRemoteAlertAdapter : UIViewController

@property (nonatomic,readonly) NSString * serviceBundleIdentifier;

@end

@interface SBWallpaperEffectView : UIView
@end

BOOL hideBlur;



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBRemoteAlertAdapter; @class SBWallpaperEffectView; 
static void (*_logos_orig$_ungrouped$SBWallpaperEffectView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SBWallpaperEffectView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBWallpaperEffectView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBWallpaperEffectView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBRemoteAlertAdapter$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL SBRemoteAlertAdapter* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBRemoteAlertAdapter$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBRemoteAlertAdapter* _LOGOS_SELF_CONST, SEL); 

#line 13 "Tweak.xm"


static void _logos_method$_ungrouped$SBWallpaperEffectView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBWallpaperEffectView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$SBWallpaperEffectView$layoutSubviews(self, _cmd);

    for (UIView* view in self.subviews) {
        if (hideBlur) {
            [view setHidden:YES];
            hideBlur = NO;
            break;
        }
    }
}








static void _logos_method$_ungrouped$SBRemoteAlertAdapter$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBRemoteAlertAdapter* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$SBRemoteAlertAdapter$viewDidLoad(self, _cmd);
    if ([self.serviceBundleIdentifier isEqualToString:@"com.apple.InCallService"]) {
        hideBlur = YES;
    }
}



static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBWallpaperEffectView = objc_getClass("SBWallpaperEffectView"); MSHookMessageEx(_logos_class$_ungrouped$SBWallpaperEffectView, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$SBWallpaperEffectView$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$SBWallpaperEffectView$layoutSubviews);Class _logos_class$_ungrouped$SBRemoteAlertAdapter = objc_getClass("SBRemoteAlertAdapter"); MSHookMessageEx(_logos_class$_ungrouped$SBRemoteAlertAdapter, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$SBRemoteAlertAdapter$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$SBRemoteAlertAdapter$viewDidLoad);} }
#line 43 "Tweak.xm"
