//
//  ProductViewController.h
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"
#import "DAO.h"
#import "Company.h"
#import "Product.h"


//@interface ProductViewController : UITableViewController<UITextFieldDelegate, WKNavigationDelegate>
@interface ProductViewController : UITableViewController

@property (nonatomic, retain) Company *company;
@property (nonatomic, retain) DAO *DataAccessObject;
@property (nonatomic, retain) WebViewController * webViewController;




@end
