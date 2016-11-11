#import "RegExCategories.h"

NSMutableArray *blockURLS = nil;

%hook SPTCoreCreateOptions
- (void)setIsTablet:(char)isTablet {
	%orig(true);
}
- (void)setEnableMftRulesForPlayer:(char)enable {
	%orig(false);
}
%end

%hook SPTAdFeatureFlagChecks
- (char)isAdsEnabled {
	return false;
}
%end
%hook SPTProductState
- (id)objectForKeyedSubscript:(NSString *)key {
	if ([key isEqualToString:@"ads"]) return [NSNumber numberWithChar:0];
	else if ([key isEqualToString:@"streaming-rules"]) return [NSString stringWithFormat:@"tablet-free"];
	else if ([key isEqualToString:@"type"]) return [NSString stringWithFormat:@"premium"];
	else if ([key isEqualToString:@"shuffle"]) return [NSNumber numberWithChar:0];
	else if ([key isEqualToString:@"on-demand"]) return [NSNumber numberWithChar:1];
	else if ([key isEqualToString:@"high-bitrate"]) return [NSNumber numberWithChar:1];
	else if ([key isEqualToString:@"low-bitrate"]) return [NSNumber numberWithChar:0];
	else if ([key isEqualToString:@"financial-product"]) return [NSString stringWithFormat:@"pr:premium,tc:0"];
	else return %orig;
}
- (id)stringForKey:(NSString *)key {
	if ([key isEqualToString:@"ads"]) return [NSString stringWithFormat:@"0"];
	else if ([key isEqualToString:@"streaming-rules"]) return [NSString stringWithFormat:@"tablet-free"];
	else if ([key isEqualToString:@"type"]) return [NSString stringWithFormat:@"premium"];
	else if ([key isEqualToString:@"shuffle"]) return [NSString stringWithFormat:@"0"];
	else if ([key isEqualToString:@"on-demand"]) return [NSString stringWithFormat:@"1"];
	else if ([key isEqualToString:@"high-bitrate"]) return [NSString stringWithFormat:@"1"];
	else if ([key isEqualToString:@"low-bitrate"]) return [NSString stringWithFormat:@"0"];
	else if ([key isEqualToString:@"financial-product"]) return [NSString stringWithFormat:@"pr:premium,tc:0"];
	else return %orig;
}
%end
%hook AdsFeatureImplementation
- (void)createSlots {
	return;
}
%end

%hook NSURLRequest
+ (id)requestWithURL:(NSURL *)url {
	if (blockURLS) {
		for (NSString *keyword in blockURLS) {
			if ([url.absoluteString rangeOfString:keyword options:NSCaseInsensitiveSearch].location != NSNotFound) {
				url = [NSURL URLWithString:@""];
				break;
			}
		}
	}
	return %orig;
}
+ (id)requestWithURL:(NSURL *)url cachePolicy:(unsigned long long)arg2 timeoutInterval:(double)arg3 {
	if (blockURLS) {
		for (NSString *keyword in blockURLS) {
			if ([url.absoluteString rangeOfString:keyword options:NSCaseInsensitiveSearch].location != NSNotFound) {
				url = [NSURL URLWithString:@""];
				break;
			}
		}
	}
	return %orig;
}
- (id)initWithURL:(NSURL *)url {
	if (blockURLS) {
		for (NSString *keyword in blockURLS) {
			if ([url.absoluteString rangeOfString:keyword options:NSCaseInsensitiveSearch].location != NSNotFound) {
				url = [NSURL URLWithString:@""];
				break;
			}
		}
	}
	return %orig;
}
- (id)initWithURL:(NSURL *)url cachePolicy:(unsigned long long)arg2 timeoutInterval:(double)arg3 {
	if (blockURLS) {
		for (NSString *keyword in blockURLS) {
			if ([url.absoluteString rangeOfString:keyword options:NSCaseInsensitiveSearch].location != NSNotFound) {
				url = [NSURL URLWithString:@""];
				break;
			}
		}
	}
	return %orig;
}
+ (id)frRequestWithURL:(NSURL *)url {
	if (blockURLS) {
		for (NSString *keyword in blockURLS) {
			if ([url.absoluteString rangeOfString:keyword options:NSCaseInsensitiveSearch].location != NSNotFound) {
				url = [NSURL URLWithString:@""];
				break;
			}
		}
	}
	return %orig;
}
+ (id)frRequestWithURL:(NSURL *)url cachePolicy:(unsigned long long)arg2 timeoutInterval:(double)arg3 {
	if (blockURLS) {
		for (NSString *keyword in blockURLS) {
			if ([url.absoluteString rangeOfString:keyword options:NSCaseInsensitiveSearch].location != NSNotFound) {
				url = [NSURL URLWithString:@""];
				break;
			}
		}
	}
	return %orig;
}
%end

%hook SPTUpsellGeneralManager
- (void)triggerUpsellForReason:(int)reason completion:(id)completion {
	return;
}
%end
