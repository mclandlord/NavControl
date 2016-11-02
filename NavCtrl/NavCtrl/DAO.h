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
#import <CoreData/CoreData.h>

NSManagedObjectModel *managedObjectModel;
NSManagedObjectContext *managedObjectContext;
NSPersistentStoreCoordinator *persistentStoreCoordinator;



@interface DAO : NSObject

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, retain) NSMutableArray *companies;
@property (nonatomic, retain) NSMutableArray *managedCompanies;

@property (nonatomic, retain) NSMutableArray *products;

-(void)getStockPrice;

+ (id)sharedManager;
- (id)init;


@end


