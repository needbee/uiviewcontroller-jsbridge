UIViewController+JSBridge
=========================

Easy way to communicate between Cocoa code and JavaScript code in a
UIWebView.

Demo
====

The demo/ folder contains a demo project showing
UIViewController+JSBridge in use. Open and run it.

Usage
=====

Add the following import to your ViewController that contains the
UIWebView:

	#import "UIViewController+JSBridge.h"

Then set up the method you want to call from JS in your view controller.
The method should have a single argument, an NSArray*. For example:

	-(void)tappedLink:(NSArray *)params;

Then, in the JS in your web view, do the following:

	window.location = "cocoa://tappedLink/param1/param2/param3"

Fill in whatever params you want to send instead of param1 etc. When
that method is called from the JS, your tappedLink method will be called
with all the appropriate params. What's passed in is the results of
[NSURL pathComponents], which has "/" as the first component, so your
params start at index 1.

Compatibility
=============

This class has been tested back to iOS 6.1.

Implementation
==============

Setting window.location is the most common way of communicating from JS
into Cocoa. This class implements:

	- (BOOL)webView:(UIWebView *)webView
	shouldStartLoadWithRequest:(NSURLRequest *)request
 	navigationType:(UIWebViewNavigationType)navigationType

in a reusable way, so you don't have to edit that method each time you
want to call a new Cocoa method.

License
=======

This code is released under the MIT License. See the LICENSE file for
details.