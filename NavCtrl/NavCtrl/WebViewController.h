//
//  WebViewController.h
//  NavCtrl
//
//  Created by Aditya Narayan on 8/11/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface WebViewController : UIViewController<WKNavigationDelegate>

@property (strong,nonatomic) WKWebView *webView;
@property (strong, nonatomic) NSString *URL;

@end