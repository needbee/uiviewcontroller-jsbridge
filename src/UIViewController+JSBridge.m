//
//  UIViewController+JSBridge.m
//  Scriptive
//
//  Created by Josh Justice on 11/16/13.
//  Copyright (c) 2013 Scriptive. All rights reserved.
//

#import "UIViewController+JSBridge.h"

@implementation UIViewController (JSBridge)

- (BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *url = request.URL;
	
	// events from js
    if( [[url scheme] isEqual:@"log"]) {
        NSLog(@"%@", [url absoluteString]);
        return NO;
	} else if( [[url scheme] isEqual:@"cocoa"]) {
        NSString *methodName = [NSString stringWithFormat:@"%@:", [url host]];
        NSArray *params = [url pathComponents];
        NSLog(@"JSBridge calling method named %@, values %@", [url host], params );
        
        SEL method = NSSelectorFromString(methodName);
        [self performSelector:method withObject:params];
        return NO;
    }
    
    // default: load it
    return YES;
}

@end
