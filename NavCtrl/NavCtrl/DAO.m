//
//  DAO.m
//  NavCtrl
//
//  Created by Aditya Narayan on 8/24/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "DAO.h"

@implementation DAO

//@synthesize someProperty;

#pragma mark Singleton Methods

+ (id)sharedManager {
    static DAO *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        
    Product *iPad = [[Product alloc]initWithName:@"iPad" imageString:@"appleipad.gif" urlString:@"https://www.apple.com/ipad"];
    Product *iPodTouch = [[Product alloc]initWithName:@"iPod Touch" imageString:@"appleipodtouch.gif" urlString:@"https://www.apple.com/ipod"];
    Product *iPhone = [[Product alloc]initWithName:@"iPhone" imageString:@"appleiphone.jpg" urlString:@"https://www.apple.com/iphone"];
    
    Product *tweetDeck = [[Product alloc]initWithName:@"TweetDeck" imageString:@"tweetdeck.jpg" urlString:@"https://tweetdeck.twitter.com"];
    Product *uberTwitter = [[Product alloc]initWithName:@"Uber Twitter" imageString:@"ubertwitter.jpg" urlString:@"https://twitter.com/uber"];
    Product *twitterAlerts = [[Product alloc]initWithName:@"Twitter Alerts" imageString:@"twitteralert.png" urlString:@"https://about.twitter.com/products/alerts"];
    
    Product *modelS = [[Product alloc]initWithName:@"Model S" imageString:@"teslamodelS.jpg" urlString:@"https://www.tesla.com/models"];
    Product *modelX = [[Product alloc]initWithName:@"Model X" imageString:@"teslamodelX.jpg" urlString:@"https://www.tesla.com/modelx"];
    Product *model3 = [[Product alloc]initWithName:@"Model 3" imageString:@"teslamodel3.jpg" urlString:@"https://www.tesla.com/model3"];
        
    Product *googleMaps = [[Product alloc]initWithName:@"Google Maps" imageString:@"Google_Maps_Icon.png" urlString:@"https://www.google.com/maps"];
    Product *googleAdwords = [[Product alloc]initWithName:@"Google Adwords" imageString:@"oogle-adwords-logo.png" urlString:@"https://www.google.com/adwords"];
    Product *gmail = [[Product alloc]initWithName:@"Gmail" imageString:@"google_gmail.png" urlString:@"https://mail.google.com"];
        
    NSMutableArray *appleProducts = [[NSMutableArray alloc]initWithObjects:iPhone, iPodTouch, iPad, nil];
    Company *apple = [[Company alloc]initWithName:@"Apple" Image:@"img-companyLogo_Apple.png" Products: appleProducts];
    NSMutableArray *twitterProducts = [[NSMutableArray alloc]initWithObjects:tweetDeck, uberTwitter, twitterAlerts, nil];
    Company *twitter = [[Company alloc]initWithName:@"Twitter" Image:@"img-companyLogo_Twitter.png" Products: twitterProducts];
    NSMutableArray *teslaProducts = [[NSMutableArray alloc]initWithObjects:modelS, modelX, model3, nil];
    Company *tesla = [[Company alloc]initWithName:@"Tesla" Image:@"img-companyLogo_Tesla.png" Products: teslaProducts];
    NSMutableArray *googleProducts = [[NSMutableArray alloc]initWithObjects:googleMaps, googleAdwords, gmail, nil];
    Company *google = [[Company alloc]initWithName:@"Google" Image:@"img-companyLogo_Google.png" Products: googleProducts];
        
    }
    return self;
}

//- (void)dealloc {
//    // Should never be called, but just here for clarity really.
//}



@end


