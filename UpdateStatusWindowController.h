//
//  UpdateStatusWindowController.h
//  iamdoingx
//
//  Created by Kalvir Sandhu on 31/05/2011.
//  Copyright 2011 GoFreeRange. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "JSON.h"

@interface UpdateStatusWindowController : NSWindowController {
  NSTextField *statusTextField;
}

@property (assign) IBOutlet NSTextField *statusTextField;

- (IBAction)postStatusUpdate:(id)sender;
- (void) postToPW;

@end
