//
//  PreferencesWindowController.m
//  iamdoingx
//
//  Created by Kalvir Sandhu on 26/05/2011.
//  Copyright 2011 GoFreeRange. All rights reserved.
//

#import "PreferencesWindowController.h"


@implementation PreferencesWindowController

@synthesize preferencesWindow;
@synthesize usernameTextField;
@synthesize oauthTokenTextField;

- (id)init
{
  [super init];
  NSMutableDictionary * defaultPrefs = [NSMutableDictionary dictionary];
    
  [defaultPrefs setObject:@"no oauth token" forKey:@"OauthToken"];
  [defaultPrefs setObject:@"no username" forKey:@"Username"];
  prefs = [[NSUserDefaults standardUserDefaults] retain];
  [prefs registerDefaults:defaultPrefs];
  return self;
}

- (void)awakeFromNib
{
  NSLog(@"Loading prefs");
  NSLog(@"username: %@",[prefs stringForKey:@"Username"]);

  [usernameTextField setStringValue:[prefs stringForKey:@"Username"]];
  [oauthTokenTextField setStringValue:[prefs stringForKey:@"OauthToken"]];
}

- (void)showWindow:(id)sender {
  [preferencesWindow setIsVisible:YES];
  [NSApp activateIgnoringOtherApps:YES];
}

- (void)save:(id)sender {
  [prefs setObject:[usernameTextField stringValue] forKey:@"Username"];
  [prefs setObject:[oauthTokenTextField stringValue] forKey:@"OauthToken"];
  [prefs synchronize];
  [preferencesWindow setIsVisible:NO];
}

- (void)cancel:(id)sender {
  [preferencesWindow setIsVisible:NO];
}

- (void)dealloc {
  [prefs release];
  [super dealloc];
}

@end
