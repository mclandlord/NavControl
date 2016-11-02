//
//  ManagedProduct+CoreDataProperties.h
//  NavCtrl
//
//  Created by Aditya Narayan on 11/2/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "ManagedProduct+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ManagedProduct (CoreDataProperties)

+ (NSFetchRequest<ManagedProduct *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSNumber *companyID;
@property (nullable, nonatomic, copy) NSString *productImage;
@property (nullable, nonatomic, copy) NSString *productName;
@property (nullable, nonatomic, copy) NSString *productUrl;
@property (nullable, nonatomic, retain) ManagedCompany *company;

@end

NS_ASSUME_NONNULL_END
