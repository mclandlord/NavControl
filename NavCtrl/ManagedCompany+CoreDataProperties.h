//
//  ManagedCompany+CoreDataProperties.h
//  NavCtrl
//
//  Created by Aditya Narayan on 11/2/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "ManagedCompany+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ManagedCompany (CoreDataProperties)

+ (NSFetchRequest<ManagedCompany *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSNumber *companyID;
@property (nullable, nonatomic, copy) NSString *companyLogo;
@property (nullable, nonatomic, copy) NSString *companyName;
@property (nullable, nonatomic, copy) NSString *stockSymbol;
@property (nullable, nonatomic, retain) NSSet<ManagedProduct *> *products;

@end

@interface ManagedCompany (CoreDataGeneratedAccessors)

- (void)addProductsObject:(ManagedProduct *)value;
- (void)removeProductsObject:(ManagedProduct *)value;
- (void)addProducts:(NSSet<ManagedProduct *> *)values;
- (void)removeProducts:(NSSet<ManagedProduct *> *)values;

@end

NS_ASSUME_NONNULL_END
