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

@interface Product : NSObject


@property (strong, nonatomic) NSString* productName;
@property (strong, nonatomic) NSString* productImageString;
@property (strong, nonatomic) NSString* productUrlString;

- (instancetype)initWithName: (NSString*) productName
                 imageString: (NSString*) imageString
                   urlString: (NSString*) urlString;





//-(void) productLogo;
//-(void) loadArray;
//
//@property (nonatomic, retain) NSMutableArray *products;
//@property (nonatomic, retain) NSMutableArray *appleProd;
//@property (nonatomic, retain) NSMutableArray *twitterProd;
//@property (nonatomic, retain) NSMutableArray *teslaProd;
//@property (nonatomic, retain) NSMutableArray *googleProd;

@end
