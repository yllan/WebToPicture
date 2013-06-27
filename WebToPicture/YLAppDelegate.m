//
//  YLAppDelegate.m
//  WebToPicture
//
//  Created by yllan on 6/27/13.
//  Copyright (c) 2013 yllan. All rights reserved.
//

#import "YLAppDelegate.h"

@implementation YLAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}
- (IBAction) goURL:(id)sender
{
    NSLog(@"%@", [sender stringValue]);
    [self.webView.mainFrame loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString: [sender stringValue]]]];
}

- (IBAction) save: (id)sender
{
    NSSize size = self.webView.mainFrame.frameView.documentView.bounds.size;
    NSBitmapImageRep *bir = [[NSBitmapImageRep alloc] initWithBitmapDataPlanes: NULL pixelsWide: size.width pixelsHigh: size.height bitsPerSample: 8 samplesPerPixel: 4 hasAlpha: YES isPlanar: NO colorSpaceName: NSCalibratedRGBColorSpace bitmapFormat:NSAlphaFirstBitmapFormat bytesPerRow: 0 bitsPerPixel: 0];
    
    [self.webView.mainFrame.frameView.documentView cacheDisplayInRect: NSMakeRect(0, 0, size.width, size.height) toBitmapImageRep: bir];
    
    NSImage *image = [[NSImage alloc] initWithSize: size];
    [image addRepresentation: bir];
    
    NSData *pngData = [bir representationUsingType: NSPNGFileType properties: Nil];
    
    NSSavePanel *savePanel = [NSSavePanel savePanel];
    savePanel.allowedFileTypes = @[@"png"];
    savePanel.allowsOtherFileTypes = NO;
    savePanel.extensionHidden = NO;
    savePanel.nameFieldStringValue = @"Capture.png";
    [savePanel beginSheetModalForWindow: self.window completionHandler: ^(NSInteger result) {
        if (result == NSFileHandlingPanelOKButton) {
            [pngData writeToURL: savePanel.URL atomically: YES];
        }
    }];
}


@end
