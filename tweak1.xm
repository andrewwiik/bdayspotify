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
