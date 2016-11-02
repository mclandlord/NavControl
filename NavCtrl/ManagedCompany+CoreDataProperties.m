//
//  ManagedCompany+CoreDataProperties.m
//  NavCtrl
//
//  Created by Aditya Narayan on 11/2/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "ManagedCompany+CoreDataProperties.h"

@implementation ManagedCompany (CoreDataProperties)

+ (NSFetchRequest<ManagedCompany *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"ManagedCompany"];
}

@dynamic companyID;
@dynamic companyLogo;
@dynamic companyName;
@dynamic stockSymbol;
@dynamic products;

@end
