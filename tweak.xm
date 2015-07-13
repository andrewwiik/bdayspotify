#import "BdaySpotify.h"
@class shared_ptr_1ac160cb;
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

%hook SPTSearchTableViewController
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
%hook SPTProductState
-(NSDictionary *)originalValues {
	NSMutableDictionary *dict = [%orig mutableCopy];
	[dict setObject:@"" forKey:@"streaming-rules"];
	[dict setObject:@"0" forKey:@"shuffle"];
	[dict setObject:@"premium" forKey:@"type"];
	[dict setObject:@"1" forKey:@"unrestricted"];
	[dict setObject:@"0" forKey:@"ads"];
	return [NSDictionary dictionaryWithDictionary:dict];
}

- (id)stringForKey:(id)arg1 {
	if ([arg1 isEqualToString:@"streaming-rules"]) {
		return @"";
	} else if ([arg1 isEqualToString:@"shuffle"]) {
		return @"0";
	}
	if ([arg1 isEqualToString:@"type"]) {
		return @"premium";
	} else if ([arg1 isEqualToString:@"unrestricted"]) {
		return @"1";
	}
	return %orig;
}
%end
%hook SPTStatefulPlayerTrackPosition
- (BOOL)isNoticeablePositionChange:(double)arg1 from:(double)arg2
{return TRUE;}
- (BOOL)deriveDisallowSeeking {return FALSE;}
- (BOOL)deriveDisallowSeekingAlway {return  FALSE;}
- (BOOL)disallowSeekingAlways {
	return FALSE;
}
- (BOOL)disallowSeeking {
	return FALSE;
}
-(id)restrictions {
	return nil;
}
%end
%hook SPTStatefulPlayer
- (BOOL)disallowSeekingAlways {return FALSE;}
- (BOOL)disallowSeeking {return FALSE;}
-(id)restrictions {
	return nil;
}
%end
%hook SPTNowPlayingPlaybackController
- (BOOL)seekingAllowed {
	return TRUE;
}
- (BOOL)scrubbing {
	return TRUE;
}

%end
%hook SPTNowPlayingDurationDataSource
- (BOOL)isVisible {
	return TRUE;
}
- (BOOL)shouldDisallowSeeking {
	return FALSE;
}
- (BOOL)durationViewDisallowSeeking:(id)arg1 {
	return FALSE;
}
- (void)updateDisallowSeeking:(BOOL)arg1 {
	%orig(TRUE);
}
%end
%hook SPTNowPlayingTrackPosition
- (BOOL)disallowSeekingAlways {
	return FALSE;
}
- (BOOL)disallowSeeking {
	return FALSE;
}
%end
%hook SPTPlayerRestrictions
- (id)serializedDictionary {
	return nil;
}
- (id)initWithDictionary:(id)arg1 {
return nil;
arg1 = nil;
}
%end
%hook SPTPlayerState
-(id)restrictions {
	return nil;
}
%end
%hook SPTNowPlayingDurationView
- (BOOL)nowPlayingSliderDisallowSeeking:(id)arg1 {
	return FALSE;
}
%end
%hook SPTNowPlayingViewController
- (BOOL)durationViewDisallowSeeking:(id)arg1 {
	return FALSE;
}
%end
%hook SPTPlayerFeatureImplementation
-(id)_mftSequenceRules {return nil;}
-(void)load {
	 [self setValue:nil forKey:@"_mftSequenceRules"];
	 %orig;
}
%end
