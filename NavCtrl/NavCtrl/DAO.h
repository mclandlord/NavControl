//
//  DAO.h
//  NavCtrl
//
//  Created by Aditya Narayan on 8/24/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Company.h"
#import "Product.h"

@interface DAO : NSObject

@property (nonatomic, retain) NSMutableArray *companies;

@property (nonatomic, retain) NSMutableArray *products;

-(void)getStockPrice;

+ (id)sharedManager;
- (id)init;


@end


