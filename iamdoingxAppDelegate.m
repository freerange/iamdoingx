//
//  iamdoingxAppDelegate.m
//  iamdoingx
//
//  Created by Kalvir Sandhu on 25/05/2011.
//  Copyright 2011 GoFreeRange. All rights reserved.
//

#import "iamdoingxAppDelegate.h"

@implementation iamdoingxAppDelegate

@synthesize statusesWindow;
@synthesize updateStatusWindow;
@synthesize statusTextField;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
}

- (void)awakeFromNib {
	statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength] retain];
	[statusItem setMenu:statusMenu];
	[statusItem setTitle:@"X"];
	[statusItem setHighlightMode:YES];
}

- (IBAction)exitApplication:(id)sender {
	[NSApp terminate:self];
}

- (IBAction)showStatusWindow:(id)sender {
	[statusesWindow setIsVisible:YES];
  [self bringToFront];
}

- (IBAction)showUpdateStatusWindow:(id)sender {
  [statusTextField setStringValue:@""];
	[updateStatusWindow setIsVisible:YES];
  [self bringToFront];
}

- (IBAction)postStatusUpdate:(id)sender {
  [self postToPW];
}

- (void)postToPW {
  NSString *statusText = [statusTextField stringValue];
  NSLog(@"%@",statusText);

  [updateStatusWindow setIsVisible:NO];
}

- (void)bringToFront {
  [NSApp activateIgnoringOtherApps:YES];
}

@end
