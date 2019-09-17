@interface SBRemoteAlertAdapter : UIViewController

@property (nonatomic,readonly) NSString * serviceBundleIdentifier;

@end

@interface SBWallpaperEffectView : UIView
@end

BOOL hideBlur;


%hook SBWallpaperEffectView

-(void)layoutSubviews {
    %orig;

    if (hideBlur) {
        for (UIView* view in self.subviews) {
            [view setHidden:YES];
            hideBlur = NO;
            break;
        }
    }
}

%end




%hook SBRemoteAlertAdapter

-(void)viewDidLoad {
    %orig;
    if ([self.serviceBundleIdentifier isEqualToString:@"com.apple.InCallService"]) {
        hideBlur = YES;
    }
}


%end
