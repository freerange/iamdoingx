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
	IBOutlet NSMenu *statusMenu;
    NSStatusItem * statusItem;
}

@property (assign) IBOutlet NSWindow *statusesWindow;
@property (assign) IBOutlet NSWindow *updateStatusWindow;

- (IBAction)exitApplication:(id)sender;
- (IBAction)showStatusWindow:(id)sender;
- (IBAction)showUpdateStatusWindow:(id)sender;

@end
