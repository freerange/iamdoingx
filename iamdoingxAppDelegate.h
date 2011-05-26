//
//  iamdoingxAppDelegate.h
//  iamdoingx
//
//  Created by Kalvir Sandhu on 25/05/2011.
//  Copyright 2011 GoFreeRange. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface iamdoingxAppDelegate : NSObject <NSApplicationDelegate> {
  NSWindow *statusesWindow;
	NSWindow *updateStatusWindow;
  NSStatusItem *statusItem;
  NSTextField *statusTextField;
  
  IBOutlet NSMenu *statusMenu;
}

@property (assign) IBOutlet NSWindow *statusesWindow;
@property (assign) IBOutlet NSWindow *updateStatusWindow;
@property (assign) IBOutlet NSTextField *statusTextField;

- (IBAction)exitApplication:(id)sender;
- (IBAction)showStatusWindow:(id)sender;
- (IBAction)showUpdateStatusWindow:(id)sender;
- (IBAction)postStatusUpdate:(id)sender;

- (void)bringToFront;
- (void)postToPW;

@end
