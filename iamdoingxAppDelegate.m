//
//  iamdoingxAppDelegate.m
//  iamdoingx
//
//  Created by Kalvir Sandhu on 25/05/2011.
//  Copyright 2011 GoFreeRange. All rights reserved.
//

#import "iamdoingxAppDelegate.h"
#import "JSON.h"

@implementation iamdoingxAppDelegate

@synthesize statusesWindow;
@synthesize updateStatusWindow;
@synthesize statusTextField;
@synthesize preferencesWindowController;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  // Do stuff here later
}

- (void)awakeFromNib {  
	statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength] retain];
	[statusItem setMenu:statusMenu];
	[statusItem setTitle:@"X"];
	[statusItem setHighlightMode:YES];

  [statusTextField setTarget:self];
  [statusTextField setAction:@selector(postToPW)];
}

- (IBAction)exitApplication:(id)sender {
	[NSApp terminate:self];
}

- (IBAction)showStatusWindow:(id)sender {
	[statusesWindow setIsVisible:YES];
  [self bringToFront];
}

- (IBAction)showUpdateStatusWindow:(id)sender {
  [self showUpdateStatus];
}

- (IBAction)postStatusUpdate:(id)sender {
  [self postToPW];
}

- (IBAction)showPreferences:(id)sender {
  [preferencesWindowController showWindow:sender];
}

- (void)showUpdateStatus {
  [statusTextField setStringValue:@""];
  [updateStatusWindow setIsVisible:YES];
  [self bringToFront];
}

- (void)postToPW {
  NSString *statusText = [statusTextField stringValue];
  
  NSMutableDictionary* jsonObject = [NSMutableDictionary dictionary];
  [jsonObject setObject:@"status" forKey:@"type"];
  [jsonObject setObject:statusText forKey:@"content"];

  NSString* jsonString = jsonObject.JSONRepresentation;
  NSLog(@"This is the json %@", jsonString);
  
  [updateStatusWindow setIsVisible:NO];
}

- (void)bringToFront {
  [NSApp activateIgnoringOtherApps:YES];
}

@end
