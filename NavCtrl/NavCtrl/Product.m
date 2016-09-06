//
//  Product.m
//  NavCtrl
//
//  Created by Aditya Narayan on 8/22/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "Product.h"

@implementation Product


- (instancetype)initWithName: (NSString*) productName
                 imageString: (NSString*) imageString
                   urlString: (NSString*) urlString
{
    self = [super init];
    if (self) {
        self.productName = productName;
        self.productUrlString = urlString;
        self.productImageString = imageString;
    }
    return self;
}

@end

