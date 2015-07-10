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
	[(NowPlayingBarViewControllerIPhone *)[[[self metaViewController] barViewController] barViewController] playPause];
	%orig;
}
%end