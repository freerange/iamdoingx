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
  NSStatusItem *statusItem;

  IBOutlet NSMenu *statusMenu;
}

@property (assign) IBOutlet NSWindow *statusesWindow;

- (IBAction)exitApplication:(id)sender;
- (IBAction)showStatusWindow:(id)sender;

@end
