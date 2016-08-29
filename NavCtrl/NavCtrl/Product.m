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





//-(void) productLogo
//{
//    self.appleProd = [[NSMutableArray alloc] initWithObjects:@"appleipad.gif", @"appleipodtouch.gif", @"appleiphone.jpg", nil];
//    self.twitterProd = [[NSMutableArray alloc] initWithObjects:@"tweetdeck.jpg", @"ubertwitter.jpg", @"twitteralert.png", nil];
//    self.teslaProd = [[NSMutableArray alloc] initWithObjects:@"teslamodelS.jpg", @"teslamodelX.jpg", @"teslamodel3.jpg", nil];
//    self.googleProd = [[NSMutableArray alloc] initWithObjects:@"Google_Maps_Icon.png", @"google-adwords-logo.png", @"google_gmail.png", nil];
//}
//
//
//-(void) loadArray
//{
//
//NSMutableArray *curRow; /* use to access the row while loading with objects */
//NSMutableArray *array = [[NSMutableArray alloc] init]; /* your main multidim array */
//
//curRow = [NSMutableArray array];
//[curRow addObject:@"iPad"];
//[curRow addObject:@"iPod Touch"];
//[curRow addObject:@"iPhone"];
//[array addObject:curRow]; /* first row is added */
//    
//curRow = [NSMutableArray array];
//[curRow addObject:@"TweetDeck"];
//[curRow addObject:@"Uber Twitter"];
//[curRow addObject:@"Twitter Alerts"];
//[array addObject:curRow];
//    
//curRow = [NSMutableArray array];
//[curRow addObject:@"Model S"];
//[curRow addObject:@"Model X"];
//[curRow addObject:@"Model 3"];
//[array addObject:curRow];
//
//curRow = [NSMutableArray array];
//[curRow addObject:@"Google Maps"];
//[curRow addObject:@"Google Adwords"];
//[curRow addObject:@"Gmail"];
//[array addObject:curRow];
//    
//    
//}

@end

