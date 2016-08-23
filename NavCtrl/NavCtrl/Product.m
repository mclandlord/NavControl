//
//  Product.m
//  NavCtrl
//
//  Created by Aditya Narayan on 8/22/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "Product.h"

@implementation Product


-(void) productNames
{
    self.appleProd = [[NSMutableArray alloc] initWithObjects:@"appleipad.gif", @"appleipodtouch.gif", @"appleiphone.jpg", nil];
    self.twitterProd = [[NSMutableArray alloc] initWithObjects:@"tweetdeck.jpg", @"ubertwitter.jpg", @"twitteralert.png", nil];
    self.teslaProd = [[NSMutableArray alloc] initWithObjects:@"teslamodelS.jpg", @"teslamodelX.jpg", @"teslamodel3.jpg", nil];
    self.googleProd = [[NSMutableArray alloc] initWithObjects:@"Google_Maps_Icon.png", @"google-adwords-logo.png", @"google_gmail.png", nil];
        
    
}


@end

