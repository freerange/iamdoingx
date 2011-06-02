//
//  PreferencesWindowController.h
//  iamdoingx
//
//  Created by Kalvir Sandhu on 26/05/2011.
//  Copyright 2011 GoFreeRange. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface PreferencesWindowController : NSWindowController {

  NSTextField *usernameTextField;
  NSTextField *oauthTokenTextField;
  
  NSUserDefaults * prefs;
}

@property (readonly, assign) IBOutlet NSTextField *usernameTextField;
@property (assign) IBOutlet NSTextField *oauthTokenTextField;

- (IBAction)save:(id)sender;
- (IBAction)hideWindow:(id)sender;

@end