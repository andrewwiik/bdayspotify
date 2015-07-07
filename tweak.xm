%hook SpotifyPreferences
-(int)audioPlayBitrate {
	return 320000;
}
%end
%hook AdsFeatureImplementation
- (BOOL)isPrerollEnabled {
	return FALSE;
}
- (BOOL)isAdsEnabledForProductState:(id)fp8 {
	return FALSE;
}
- (void)load {
	return;
}
%end
%hook SPTAccountController
- (BOOL)canActivatePremiumTrial {
	return TRUE;
}
%end
%hook SPTAlbumViewController
- (BOOL)isTabletFreeModeEnabled {
	return TRUE;
}
%end
%hook SPTArtistTracksTableViewDataSource
- (BOOL)isTabletFreeModeEnabled {
	return TRUE;
}
%end
%hook SPTExternalPlaybackStatus 
	- (BOOL)canSeek {
	return TRUE;
}
- (BOOL)canSkipPrevious {
	return TRUE;
}
- (BOOL)canSkipNext {
	return TRUE;
}
%end
%hook SPTNowPlayingPlaybackController
- (BOOL)seekingAllowed {
	return TRUE;
}
- (BOOL)disallowTogglingRepeat {
	return FALSE;
}
- (BOOL)disallowTogglingShuffle {
return FALSE;
}
- (BOOL)canSkipNext {
	return TRUE;
}
- (BOOL)shouldShowSkippingNextUpsell {
	return TRUE;
}
 - (BOOL)canShowSkippingNextUpsell {
 	return FALSE;
 }
%end
%hook SPTPlayerRestrictions
- (BOOL)disallowSeeking {
	return FALSE;
}
- (BOOL)disallowSkippingToNextTrack {
	return FALSE;
}
- (BOOL)disallowSkippingToPreviousTrack {
	return FALSE;
}
%end
%hook SPTrackContext
- (BOOL)shuffle {
	return FALSE;
}
- (BOOL)canSkipBackward {
	return TRUE;
}
- (BOOL)canSkipForward {
	return TRUE;
}
%end
%hook SPTTableViewCell
- (BOOL)isShuffleTrackCell {
	return FALSE;
}
%end
%hook UpsellFeatureImplementation
- (id)shuffleFeature {
	return NULL;
}
- (id)baseFeature {
	return NULL;
}
%end
%hook SPTAdEntityViewModel
- (BOOL)canSkip {
	return TRUE;
}
%end
%hook SPTAVPlayerItemLogger
- (BOOL)skipped {
	return FALSE;
}
%end
%hook SPTNowPlayingBarModel
- (BOOL)skippingToNextTrackAllowed {
	return TRUE;
}
- (BOOL)skippingToPreviousTrackAllowed {
	return TRUE;
}
 - (int)numberOfNextSkips {
 	return 1;
 }
- (int)numberOfPreviousSkips {
	return 1;
}
- (BOOL)shouldShowSkipNextUpsell {
	return FALSE;
}
%end
%hook SPTProductStateMonitorController
- (BOOL)isTrialOrPremiumUser {
	return TRUE;
}
%end
%hook SPTAccountSettingsViewModel

- (bool)isTrialAvailable {
	return TRUE;
}
- (int)daysLeftOfProductWithExpiryDate {
	return 999999999;
}
%end
%hook ShuffleFeatureImplementation 
- (void)load {
	return;
}
%end
