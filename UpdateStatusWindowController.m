//
//  UpdateStatusWindowController.m
//  iamdoingx
//
//  Created by Kalvir Sandhu on 31/05/2011.
//  Copyright 2011 GoFreeRange. All rights reserved.
//

#import "UpdateStatusWindowController.h"

@implementation UpdateStatusWindowController

@synthesize statusTextField;

- (void) awakeFromNib {
  [statusTextField setTarget:self];
  [statusTextField setAction:@selector(postToPW)];
}

- (void) showWindow:(id)sender {
  [statusTextField setStringValue:@""];
  [NSApp activateIgnoringOtherApps:YES];
  [[self window] setIsVisible:YES];
}

- (IBAction)postStatusUpdate:(id)sender {
  [self postToPW];
}

- (void) postToPW {
  NSString *statusText = [statusTextField stringValue];
  
  NSUserDefaults *prefs = [[NSUserDefaults standardUserDefaults] retain];
  
  NSMutableDictionary* jsonObject = [NSMutableDictionary dictionary];
  [jsonObject setObject:@"status" forKey:@"type"];
  [jsonObject setObject:statusText forKey:@"content"];
  [jsonObject setObject:[prefs stringForKey:@"Username"] forKey:@"user"];
  
  NSString* jsonString = jsonObject.JSONRepresentation;
  NSLog(@"This is the json %@", jsonString);
  
  NSURL *url = [NSURL URLWithString:@"http://localhost:5032/test/messages"];
  NSMutableURLRequest *statusUpdateRequest = [NSMutableURLRequest requestWithURL:url];
  [statusUpdateRequest setHTTPMethod:@"POST"];
  [statusUpdateRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
  [statusUpdateRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [statusUpdateRequest addValue:[NSString stringWithFormat:@"%d", [jsonString length]] forHTTPHeaderField:@"Content-Length"];
  [statusUpdateRequest setHTTPBody:[NSData dataWithBytes:[jsonString UTF8String] length:[jsonString length]]];
  
  //  NSHTTPURLResponse *response = NULL;
  //  NSData *responseData = [NSURLConnection sendSynchronousRequest:statusUpdateRequest returningResponse:&response error:nil];
  //  NSString *responseDataString = [[NSString alloc] initWithData:responseData encoding:NSASCIIStringEncoding];
  //  NSLog(@"Response from PW: %@", responseDataString);
  
  [[self window] setIsVisible:NO];
  [prefs release];
}

@end
