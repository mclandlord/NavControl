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

@interface Company : NSObject

//- (void)companyNames;

@property (nonatomic, retain) NSString *companyName;
@property (nonatomic, retain) NSString *companyImageString;
@property (nonatomic, retain) NSMutableArray *products;

- (instancetype)initWithName: (NSString*) companyName
                       Image: (NSString*) imageString
                    Products: (NSMutableArray*) products;

@end
