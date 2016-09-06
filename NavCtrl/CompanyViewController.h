//
//  CompanyViewController.h
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "DAO.h"
#import "Company.h"
#import "Product.h"

@class ProductViewController;

@interface CompanyViewController : UITableViewController<UITextFieldDelegate, WKNavigationDelegate>

@property (nonatomic, retain) NSMutableArray<Company*> *companyList;

@property (nonatomic, retain) DAO *DataAccessObject;

@property (nonatomic, retain) IBOutlet  ProductViewController * productViewController;

@end
