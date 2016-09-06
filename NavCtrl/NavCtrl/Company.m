//
//  Company.m
//  NavCtrl
//
//  Created by Aditya Narayan on 8/22/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "Company.h"

@implementation Company

- (instancetype)initWithName: (NSString*) companyName
                       Image: (NSString*) imageString
                    Products: (NSMutableArray*) products
{
    self = [super init];
    if (self) {
        self.companyName = companyName;
        self.companyImageString = imageString;
        self.products = products;
    }
    return self;
}

@end


