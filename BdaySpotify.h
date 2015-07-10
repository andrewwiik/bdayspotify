@interface NowPlayingBarViewControllerIPhone : UIViewController
- (void)playPause;
@end

@interface SPBarViewController : UIViewController
@property(retain, nonatomic) UIViewController *barViewController; // supports <SPTBarInteractiveTransitionParticipant> protocol
@end

@interface MetaViewController : UIViewController
@property(retain, nonatomic) SPBarViewController *barViewController;
@end

@interface PlaylistViewController : UIViewController
@property(assign) __weak MetaViewController *metaViewController;
@end