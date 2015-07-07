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
id cheatingDict() {
return @{@"detailed-crash-dumps" : @"0", @"remote-control" : @"6", @"connect-dial-discovery" : @"1", @"release-countries" : @"DK,ES,FI,FR,GB,NL,NO,SE,US,AT,CH,BE,DE,NZ,AU,AD,IE,LU,LI,MC,IT,PL,PT,HK,MY,SG,EE,IS,LT,LV,MX,TR,GR,TW,AR,HU,CZ,MT,BG,SK,CY,CL,CO,UY,SV,PY,HN,PA,NI,PE,EC,DO,GT,CR,BO,PH,BR,CA", @"ab-mobile-startpage" : @"0", @"license-agreements" : @"0.8.8-US", @"twitter-feedback" : @"1", @"ab-new-share-flow" : @"1", @"ab-discover" : @"1", @"ab-connect-npb-icon" : @"0", @"hide-share-column" : @"0", @"ab-collection-offline-mode" : @"0", @"ab-test-group" : @"551", @"incognito_mode_timeout" : @"21600", @"playlist-folders" : @"1", @"payments-initial-campaign" : @"familyplansub", @"ab-connect-transfer-popup" : @"1", @"ab-desktop-social-feed" : @"1", @"user-profile-show-invitation-codes" : @"0", @"user-policy-version" : @"2.0.0-1092-63-2015-04-15-acb8aed", @"ab-browse-app" : @"1", @"mobile" : @"1", @"ab-mobile-profile-exp-policies" : @"3", @"streaming-rules" : @"", @"context-player-enabled" : @"1", @"image-url" : @"http://images.spotify.com/image/{file_id}", @"x-promo-skippable-tracks" : @"7", @"radio" : @"1", @"country_code" : @"US", @"ad-formats-preroll-video" : @"1", @"ab-desktop-notification-center" : @"1", @"ab-desktop-discover" : @"1", @"ab-playlist-annotation-edit" : @"2", @"allow-override-internal-prefs" : @"0", @"param-test" : @"value", @"ab-mobile-follow" : @"3", @"mobile-payment" : @"1", @"financial-product" : @"pr:premium,tc:0,rt:familyplan4-sub", @"ab-desktop-hide-follow" : @"1", @"p2p" : @"0", @"ab-desktop-stitch-inbox" : @"1", @"integrated-purchases" : @"0", @"instant-search" : @"0", @"ab-buddy-list" : @"0", @"buffering-strategy-parameters" : @"0.8:0.2:0.0:0.0:0.0:0.0:1.0:10:10:2000:10000:10485760", @"ab-desktop-deprecate-buddy-feed" : @"0", @"prefetch-window-max" : @"2", @"iphone-rateme-enabled" : @"1", @"ab-mobile-hubs" : @"0", @"glenn-v1" : @"0", @"playlist-annotations-markup" : @"0", @"ads" : @"0", @"offline" : @"1", @"libspotify" : @"1", @"ab-mobile-http" : @"Control", @"shuffle-eligible" : @"1", @"ugc-abuse-report" : @"0", @"network-operator-premium-activation" : @"1", @"ab-mobile-new-playlist" : @"1", @"repeat-one" : @"1", @"name" : @"Spotify Premium", @"ad-formats-banner" : @"0", @"ab-watch-now-cosmos" : @"1", @"payments-cancel-state-interstitial" : @"0", @"abc-browse-front" : @"2", @"audio-preview-url-template" : @"http://d318706lgtcm8e.cloudfront.net/mp3-preview/{id}", @"head-files" : @"1", @"hide-empty-starred" : @"0", @"ab-listen-later" : @"0", @"ab-browse-running" : @"0", @"enable-gapless" : @"1", @"ab-mobile-profile" : @"1", @"ab-watch-now" : @"1", @"ab-collection-filter-sort" : @"1", @"publish-playlist" : @"1", @"ab-mobile-offline-search" : @"0", @"public-toplist" : @"7", @"collection" : @"1", @"ab-browse-music-tuesday" : @"1", @"shuffle" : @"0", @"post-open-graph" : @"0", @"ab-mobile-social-feed" : @"1", @"connect-showcase" : @"1", @"buffering-strategy" : @"0", @"ab-collection-cosmos" : @"0", @"mobile-login" : @"1", @"metadata-link-lookup-modes" : @"-1", @"uber-showcase" : @"0", @"ab-social-chart" : @"1", @"expiry" : @"1", @"ab-collection-union" : @"1", @"ab-airplay-icon" : @"0", @"social-intro-flow" : @"0", @"upsell-automatic-relogin-flow" : @"0", @"ab-mobile-running" : @"Control", @"ab-web-social-feed" : @"0", @"ab-mobile-browse-new-overview-design" : @"1", @"use-pl3" : @"0", @"integrated-purchases-style" : @"0", @"ab-gaia-chromecast-support" : @"0", @"high-bitrate" : @"1", @"enable-autostart" : @"1", @"android-cat" : @"1", @"ap-resolve-pods" : @"0", @"send-email" : @"1", @"low-bitrate" : @"1", @"ab-watch-now-ipad" : @"0", @"ab-browse-discover-takeover" : @"1", @"enable-crossfade" : @"1", @"streaming" : @"1", @"android-search-v3" : @"0", @"app-developer" : @"0", @"ab-remove-toplists" : @"0", @"ab-connect-localnet-control" : @"0", @"type" : @"premium", @"payment-state" : @"", @"browse-overview-enabled" : @"0", @"ab-mobile-abba-http" : @"http", @"ab-capper-monthly-refill" : @"0", @"ab-desktop-deprecate-nux-eux" : @"1", @"unrestricted" : @"1", @"ad-formats-preroll-rerequest-video" : @"0", @"ab-connect-onboarding" : @"0", @"ab-desktop-social-chart" : @"1", @"shuffle-algorithm" : @"1", @"use-fb-publish-backend" : @"0", @"capping-bar-threshold" : @"3601", @"key-caching-max-offline-seconds" : @"1800", @"capper-profile" : @"premium", @"preferred-locale" : @"en-us", @"on-demand" : @"1", @"ab-play-history" : @"0", @"ab-mobile-upsell-new-layout" : @"1", @"payments-locked-state" : @"0", @"explicit-content" : @"0", @"ab-ad-player-targeting" : @"1", @"arsenal_country" : @"1", @"ad-session-persistence" : @"0", @"instant-search-expand-sidebar" : @"0", @"connect-onboarding-interval" : @"0", @"enable-hiding-purchase-buttons" : @"1", @"rafiki-charts" : @"0", @"remote-control-version" : @"2", @"track-cap" : @"0", @"connect-playback-only" : @"0", @"key-caching-max-count" : @"1000", @"mercury-cache-version" : @"0", @"catalogue" : @"premium", @"ab-mobile-audio-touch" : @"enabled,no-tutorial", @"prefetch-keys" : @"1", @"enable-annotations-read" : @"0", @"local-files" : @"1", @"ad-exoplayer-video" : @"0", @"ab-ad-stack" : @"1", @"ab-mobile-search-curate" : @"2", @"ab-mobile-now-playing" : @"0", @"ab-collection-flat-layout" : @"1", @"fb-grant-permission-local-render" : @"0", @"link-tutorial-completed" : @"1", @"ab-collection-hide-unavailable-albums" : @"0", @"use-playlist-uris" : @"0", @"ab-mobile-artist" : @"2", @"pause-after" : @"0", @"ad-formats-video-takeover" : @"0", @"prefetch-strategy" : @"2", @"ab-web-stitch-inbox" : @"1", @"lastfm-session" : @"", @"ab-android-push-notifications" : @"1", @"context-player-for-my-music-enabled" : @"1", @"head-files-url" : @"http://heads-ec.spotify.com/head/{file_id}", @"shows-collection" : @"0", @"glenn-v2" : @"0", @"attributes-complete" : @"complete", @"enable-annotations" : @"0", @"wanted-licenses" : @"0.8.8-US", @"offline-mode" : @"1", @"ab-mobile-discover" : @"1", @"ugc-abuse-report-url" : @"https://support.spotify.com/us/abuse/?uri={uri}", @"ab-mobile-cosmos-search" : @"0"}; 
}

%hook SPTProductState

// Original Values
-(id)originalValues {
	return cheatingDict();
}
-(id)sta_originalValues {
	return cheatingDict();
}
-(void)setOriginalValues:(id)arg1 {
	%orig(cheatingDict());
}

// Values
-(id)values {
	return cheatingDict();
}
-(id)sta_values {
	return cheatingDict();
}

// Overrides
-(id)overrides {
	return cheatingDict();
}
-(void)setOverrides:(id)arg1 {
	%orig(cheatingDict());
}

%end
%hook SPTProductState-Protocol
-(id)values {
	return cheatingDict();
}
-(id)overrides {
	return cheatingDict();
}
-(id)originalValues {
	return cheatingDict();
}
%end

