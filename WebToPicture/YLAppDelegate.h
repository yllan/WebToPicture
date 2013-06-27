//
//  YLAppDelegate.h
//  WebToPicture
//
//  Created by yllan on 6/27/13.
//  Copyright (c) 2013 yllan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface YLAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet WebView *webView;
@property (weak) IBOutlet NSTextField *urlField;
- (IBAction)save:(id)sender;

@end
