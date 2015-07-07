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
%end
%hook SPTPlayerRestrictions
- (BOOL)disallowSeeking {
	return FALSE;
}
%end
%hook SPTrackContext
- (BOOL)shuffle {
	return FALSE:
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
