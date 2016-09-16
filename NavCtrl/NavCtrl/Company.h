//
//  Company.h
//  NavCtrl
//
//  Created by Aditya Narayan on 8/22/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "DAO.h"
#import "Product.h"

@class Product;
@interface Company : NSObject

@property (nonatomic, retain) NSString *companyName;
@property (nonatomic, retain) NSString *companyImageString;
@property (nonatomic, retain) NSString *stockSymbol;
@property (nonatomic, retain) NSMutableArray<Product*> *products;

- (instancetype)initWithName: (NSString*) companyName
                       Image: (NSString*) imageString
                       Stock: (NSString*) stockSymbol
                    Products: (NSMutableArray*) products;

@end
