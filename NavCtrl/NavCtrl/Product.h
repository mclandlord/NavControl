//
//  Product.h
//  NavCtrl
//
//  Created by Aditya Narayan on 8/22/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "DAO.h"

@class Company;
@interface Product : NSObject


@property (strong, nonatomic) NSString* productName;
@property (strong, nonatomic) NSString* productImageString;
@property (strong, nonatomic) NSString* productUrlString;

- (instancetype)initWithName: (NSString*) productName
                 imageString: (NSString*) imageString
                   urlString: (NSString*) urlString;


@end
