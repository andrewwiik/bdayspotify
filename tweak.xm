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
	%orig;
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
%hook SPTUpsellPagingViewController
- (id)initWithFrame:(struct CGRect)arg1 withTheme:(id)arg2 productActivationController:(id)arg3 context:(id)arg4 experiments:(id)arg5 upsoldProduct:(long long)arg6 reason:(long long)arg7 logger:(id)arg8 {
	return nil;
}
%end
%hook ShuffleFeatureImplementation
- (void)productState:(id)arg1 stateDidChange:(id)arg2 {
	return;
}
- (void)enableShuffleMode {
	return;
}
%end
%hook SPTSearchRequestParameters
-(BOOL)shuffleMode {
	return NO;
}
%end
/*%hook SPTProductState
-(NSDictionary *)originalValues {
	NSMutableDictionary *dict = [%orig mutableCopy];
	[dict setObject:@"" forKey:@"streaming-rules"];
	[dict setObject:@"0" forKey:@"shuffle"];
	return [NSDictionary dictionaryWithDictionary:dict];
}

- (id)stringForKey:(id)arg1 {
	if ([arg1 isEqualToString:@"streaming-rules"]) {
		return @"";
	} else if ([arg1 isEqualToString:@"shuffle"]) {
		return @"0";
	}
	return %orig;
}
%end*/