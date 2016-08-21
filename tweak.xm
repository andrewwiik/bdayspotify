#define PLIST_PATH @"/User/Library/Preferences/com.tonykraft.bdayprefs.plist"

inline bool GetPrefBool(NSString *key) {
    bool defaultValueWhenPreferenceIsMissing = true;
    NSNumber *preferenceValue = [[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key];

    if (!preferenceValue) {
        return defaultValueWhenPreferenceIsMissing;
    }
    return [preferenceValue boolValue];
}

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

%hook SPTSearchTableViewController
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2 {
	if ([[(NowPlayingBarViewControllerIPhone *)[[[self metaViewController] barViewController] barViewController] nowPlayingModel] isPlaying])
		[(NowPlayingBarViewControllerIPhone *)[[[self metaViewController] barViewController] barViewController] playPause];

	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^(void){
		%orig;
	});
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
%hook SPTNowPlayingPlaybackController
- (BOOL)seekingAllowed {
	return TRUE;
}
- (BOOL)scrubbing {
	return TRUE;
}

%end
%hook SPTPlayerRestrictions
- (id)serializedDictionary {
	return nil;
}
%end
%hook SPTPlayerState
-(id)restrictions {
	return nil;
}
%end
%hook SPTPlayerFeatureImplementation
-(id)_mftSequenceRules {return nil;}
-(void)load {
	 [self setValue:nil forKey:@"_mftSequenceRules"];
	 %orig;
}
%end

%hook TrialController

- (bool)isPaymentStateConsumed {
	return TRUE;
}

- (bool)isTrialActive {
	return TRUE;
}

- (bool)isTrialState {
	return TRUE;
}

- (void)setTrialState:(int)arg1 expirationDate:(id)arg2 {
	YES;
}

- (int)state {
	return 1;
}

%end

%hook AdsFeatureImplementation

- (bool)isTrialOrPremiumUser {
	return TRUE;
}

%end

%hook SPTAccountSettingsViewModel

- (bool)isTrialAvailable {
	return TRUE;
}

- (void)setTrialAvailable {
	YES;
}

- (void)setStartTrialInProgressObservation {
	NO;
}

- (id)startTrialInProgressObservation {
	return NULL;
}

- (int)daysLeftOfProductWithExpiryDate {
	return 999999999;
}

%end

%hook SPTUpsellPagingViewController

- (bool)isTrialEligible {
	return TRUE;
}

- (void)tryPremium:(id)arg1 {
	YES;
}

- (void)handleNotEligibleForTrialInFrame {
	NO;
}

- (void)handleEligibleForTrialInFrame {
	YES;
}

- (bool)ta_isTrialEligible {
	return TRUE;
}

- (id)initWithFrame:(struct CGRect)arg1 withTheme:(id)arg2 productActivationController:(id)arg3 context:(id)arg4 experiments:(id)arg5 upsoldProduct:(long long)arg6 reason:(long long)arg7 logger:(id)arg8 {
	return nil;
}

%end

%hook InAppPurchaseModel

- (bool)hasPremiumProductSettingExpired {
	return FALSE;
}

%end

%hook SPTProductStateMoniterController

- (bool)isTrialOrPremiumUser {
	return TRUE;
}

- (void)relogUserForPremiumActivation {
	NO;
}

- (void)startObservingPaymentAndProductChanges {
	NO;
}

%end

%hook InAppPurchaseControllerImplementation

- (void)verifyStoredTransactionReceipt {
	NO;
}

- (void)transactionPurchased {
	YES;
}
- (bool)isPremiumUser {
	return TRUE;
}

%end

%hook SPTAccountController7DayTrialProductActivation

- (void)start {
	YES;
}

%end

%hook SPTUpsellFeatureImplementation

- (bool)trialControllerShouldShowTrialStarted:(id)arg1 {
	return TRUE;
}

- (bool)trialStartedRequirement {
	return TRUE;
}

%end

%hook SPTOfflineLibraryViewModel

- (bool)shouldShowTrialButton {
	return TRUE;
}

%end

@class shared_ptr_1ac160cb;

%hook SPTTableViewCell
- (BOOL)isShuffleCell {
	return FALSE;
}
%end
%hook SPTSearchPlayer
- (void)playSearchEntityAtIndexPath:(id)arg1 pauseIfPlaying:(BOOL)arg2 {
    arg2=TRUE;
	%orig;
}
%end
%hook SPTSearchRequestParameters
-(BOOL)shuffleMode {
	return NO;
}
%end
%hook SPTProductState
-(NSDictionary *)values{
	NSMutableDictionary *dict = [%orig mutableCopy];
	[dict setObject:@"" forKey:@"streaming-rules"];
	[dict setObject:@"0" forKey:@"shuffle"];
	[dict setObject:@"premium" forKey:@"type"];
	[dict setObject:@"1" forKey:@"unrestricted"];
	[dict setObject:@"0" forKey:@"ads"];
	[dict setObject:@"Spotify Premium" forKey:@"name"];
	[dict setObject:@"pr:premium,tc:0" forKey:@"financial-product"];
	[dict setObject:@"premium" forKey:@"capper-profile"];
	[dict setObject:@"inf" forKey:@"streaming-max-skips-per-hour"];
	[dict setObject:@"1" forKey:@"on-demand"];
	[dict setObject:@"1" forKey:@"streaming"];
	[dict setObject:@"1000" forKey:@"x-promo-skippable-tracks"];
	[dict setObject:@"1" forKey:@"high-bitrate"];
	[dict setObject:@"0" forKey:@"context-player-enabled"];
	[dict setObject:@"10" forKey:@"prefetch-window-max"];
	[dict setObject:@"opt-in-trial;604800;1438026932" forKey:@"payment-state"];
	[dict setObject:@"1" forKey:@"mobile"];

	return [NSDictionary dictionaryWithDictionary:dict];
}
-(id)sta_overrides {
return @{@"type" : @"premium", @"unrestricted" : @"1", @"x-promo-skippable-tracks" : @"1000", @"capper-profile" : @"premium", @"financial-product" : @"pr:premium,tc:0", @"network-operator-premium-activation" : @"1", @"shuffle" : @"0", @"context-player-enabled" : @"0"};
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
	if ([arg1 isEqualToString:@"financial-product"]) {
		return @"pr:premium,tc:0";
	} else if ([arg1 isEqualToString:@"capper-profile"]) {
		return @"premium";
	}
	if ([arg1 isEqualToString:@"unrestricted"]) {
		return @"1";} else if ([arg1 isEqualToString:@"streaming"]) {
		return @"1";
	}
	if ([arg1 isEqualToString:@"x-promo-skippable-tracks"]) {
		return @"7777";} else if ([arg1 isEqualToString:@"context-player-enabled"]) {
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
- (BOOL)disallowSkippingToRelativeIndex:(int)fp8 {
	return FALSE;
	%orig;
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
	%orig(FALSE);
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
%hook SPTSkipOptions
- (BOOL)overrideRestrictions {
	return TRUE;
}
- (BOOL)_overrideRestrictions {
	return TRUE;
}
%end
%hook SPTTrackContextContentItem
-(BOOL)playable {
	return TRUE;
}
%end
%hook SPTPlayerContext
-(id)restrictions {
	return nil;
}
%end
static id model;

%hook SPTNowPlayingBarModel
- (id)initWithPlayer:(id)arg1 collection:(id)arg2 nowPlayingModel:(id)arg3 featureFlags:(id)arg4 localSettings:(id)arg5 productState:(id)arg6 runningTestManager:(id)arg7 {
	model = %orig;
	return model;
}
%end

%hook PlaylistViewController
-(void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2 {
	[model pause];
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		%orig;
		[model resume];
	});
}
%end
%hook SPTArtistAlbumViewController
-(void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2 {
	[model pause];
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		%orig;
		[model resume];
	});
}
%end
%hook SPTAlbumViewController
-(void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2 {
	[model pause];
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		%orig;
		[model resume];
	});
}
%end
%hook AdsFeatureImplementation

- (bool)isAdsEnabledForProductState:(id)arg1 {
	return NO;
}
%end

%hook SPTPromotedContentFeatureImplementation

- (bool)areAdsEnabled {
	return NO;
}

%end

%hook SWGInitializeCall

- (id)xappAdsEnabled {
	return nil;
}

%end

%hook CLSAnalyticsMetadataController

- (bool)hostJailbroken {
	return NO;
}

%end

%hook GADDevice

- (bool)isJailbroken {
	return NO;
}

%end

%hook CSComScore

+(bool)isJailbroken {
	return NO;
}

%end

%hook CSCore

- (bool)isJailbroken {
	return NO;
}

%end

%hook SPTNowPlayingViewController

- (id)adsManager {
	return nil;
}

%end

%hook SpotifyPreferences

- (long long)audioPlayBitrate {
	return 320;
}

%end

%hook SPTPlayerRestrictions

- (bool)disallowSkippingToNextTrack {
	return NO;
}

- (BOOL)disallowSkippingToPreviousTrack {
	return NO;
}

- (BOOL)disallowSeeking {
	return NO;
}

- (BOOL)disallowPlaying {
	return NO;
}

- (id)disallowSkippingToNextTrackReasons {
	return nil;
}

- (id)disallowStoppingReasons {
	return nil;
}

- (id)initWithDictionary:(id)arg1 {
	return nil;
}

%end

%hook SPTStatefulPlayerQueue

- (BOOL)predictQueueRestrictionForRelativeIndex:(int)arg1 disallowPrevious:(BOOL)arg2 disallowNext:(BOOL)arg3 {
	return NO;
	arg2=NO;
	arg3=NO;
}
%end

%hook SPTrackContext

- (BOOL)canSkipForward {
	return YES;
}

- (BOOL)canSkipBackward {
	return YES;
}

- (BOOL)canRepeat {
	return YES;
}

%end

%hook SPTStatefulPlayerPlaybackControls

- (id)observers {
	return nil;
}

%end

%hook RadioFeatureImplementation

- (id)ads {
	return nil;
}

%end

%hook SPTRadioManager

- (id)featureFlags {
	return nil;
}

- (id)observers {
	return nil;
}

%end

%hook SPTUpsellPlaybackErrorManager

- (void)showOnlyAvailableInPremiumDialog {

}

- (id)upsellManager {
	return nil;
}

%end

%hook SPTErrorPlaybackDialogs

- (void)showOnlyAvailableInPremiumDialogForError:(id)arg1 {

}

%end
@interface UIDevice (Spotify)
@end
%hook UIDevice
- (id)spt_hardwareIdentifier {
	return [NSString stringWithFormat:@"iPad Air 2"];
}
- (id)adjDeviceType {
	return [NSString stringWithFormat:@"iPad"];
}
%end


int (*orig_sysctlbyname)(const char *name, void *oldp, size_t *oldlenp, void *newp, size_t newlen);
int my_sysctlbyname(const char *name, void *oldp, size_t *oldlenp, void *newp, size_t newlen){

    if (strcmp(name, "hw.machine") == 0) {

        int ret = orig_sysctlbyname(name, oldp, oldlenp, newp, newlen);

        if (oldp != NULL) {

            NSLog(@"+++\n+++\n+++\n+++\n+++:before %s +++\n+++\n+++\n++++",(char*)oldp);

            const char *mechine1 = "iPad5,3";

            strncpy((char*)oldp, mechine1, strlen(mechine1));

            NSLog(@"+++\n+++\n+++\n+++\n+++:after  %s +++\n+++\n+++\n++++",(char*)oldp);
        }

        return ret;

    }else{
        return orig_sysctlbyname(name, oldp, oldlenp, newp, newlen);
    }
}


static __attribute__((constructor)) void _logosLocalCtor_eb769390() {
    MSHookFunction((void *)MSFindSymbol(NULL,"_sysctlbyname"), (void *)my_sysctlbyname, (void **)&orig_sysctlbyname);
}


%hook SpotifyPreferences

- (long long)audioPlayBitrate {
	if (GetPrefBool(@"extreme")) return 320;
	return %orig;
}

%end

%hook ASIdentifierManager

- (id)advertisingIdentifier {
	return nil;
}

+ (id)sharedManager {
	return nil;
}

%end
