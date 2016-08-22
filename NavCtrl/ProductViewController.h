//
//  ProductViewController.h
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "WebViewController.h"

//@interface ProductViewController : UITableViewController<UITextFieldDelegate, WKNavigationDelegate>
@interface ProductViewController : UITableViewController

@property (nonatomic, retain) NSMutableArray *products;
@property (nonatomic, retain) NSMutableArray *appleProd;
@property (nonatomic, retain) NSMutableArray *twitterProd;
@property (nonatomic, retain) NSMutableArray *teslaProd;
@property (nonatomic, retain) NSMutableArray *googleProd;

@property (nonatomic, retain) WebViewController * webViewController;
@property (strong, nonatomic) NSString *productUrl;

//@property (strong, nonatomic) NSArray *URLApple;
//@property (strong, nonatomic) NSArray *URLTwitter;
//@property (strong, nonatomic) NSArray *URLTesla;
//@property (strong, nonatomic) NSArray *URLGoogle;


@end
