//
//  NBViewController.m
//  demo
//
//  Created by Josh Justice on 3/15/14.
//  Copyright (c) 2014 NeedBee. All rights reserved.
//

#import "NBViewController.h"
#import "UIViewController+JSBridge.h"

@interface NBViewController ()

@property (nonatomic,retain) IBOutlet UIButton *button;
@property (nonatomic,retain) IBOutlet UIWebView *webView;

-(IBAction)tappedButton;
-(void)tappedLink:(NSArray *)params;

@end

@implementation NBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [_button setTitle:@"0" forState:UIControlStateNormal];
    
    NSString *pageContent = @"<html><head><script type='text/javascript' src='jquery-2.0.3.min.js'></script><script type='text/javascript' src='test.js'></script></head><body style='text-align: center'><a href='#' id='link'>0</a></body></html>";
    NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    [_webView loadHTMLString:pageContent baseURL:baseURL];
}

-(IBAction)tappedButton
{
    // increment UIButton title by 1
    int num = [[_button titleForState:UIControlStateNormal] intValue];
    num++;
    [_button setTitle:[NSString stringWithFormat:@"%d", num] forState:UIControlStateNormal];
    
    // send new title to web view
    [_webView stringByEvaluatingJavaScriptFromString:
     [NSString stringWithFormat:@"updateTitle(%d)", num]];
}

-(IBAction)tappedLink:(NSArray *)params
{
    // set UIButton title to the value sent from web view
    int num = [[params objectAtIndex:1] intValue];
    [_button setTitle:[NSString stringWithFormat:@"%d", num] forState:UIControlStateNormal];
}

@end
