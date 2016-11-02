//
//  ManagedProduct+CoreDataProperties.m
//  NavCtrl
//
//  Created by Aditya Narayan on 11/2/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "ManagedProduct+CoreDataProperties.h"

@implementation ManagedProduct (CoreDataProperties)

+ (NSFetchRequest<ManagedProduct *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"ManagedProduct"];
}

@dynamic companyID;
@dynamic productImage;
@dynamic productName;
@dynamic productUrl;
@dynamic company;

@end
