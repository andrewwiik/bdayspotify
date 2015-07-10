#import "BdaySpotify.h"
%hook SPTTableViewCell
- (BOOL)isInteractive {
	return TRUE;
}
%end
%hook SPTSearchEntity
- (BOOL)isInteractive {
	return TRUE;
}
%end
%hook SPTSearchPlayer
- (void)playSearchEntityAtIndexPath:(id)arg1 pauseIfPlaying:(_Bool)arg2 {
YES;
}
%end
%hook PlaylistViewController
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2 {
	if ([[(NowPlayingBarViewControllerIPhone *)[[[self metaViewController] barViewController] barViewController] nowPlayingModel] isPlaying])
		[(NowPlayingBarViewControllerIPhone *)[[[self metaViewController] barViewController] barViewController] playPause];

	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^(void){
		%orig;
	});
}
%end