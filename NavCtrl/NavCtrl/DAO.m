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
        Product *googleAdwords = [[Product alloc]initWithName:@"Google Adwords" imageString:@"google-adwords-logo.png" urlString:@"https://www.google.com/adwords"];
        Product *gmail = [[Product alloc]initWithName:@"Gmail" imageString:@"google_gmail.png" urlString:@"https://mail.google.com"];
        
        NSMutableArray *appleProducts = [[NSMutableArray alloc]initWithObjects:iPhone, iPodTouch, iPad, nil];
        Company *apple = [[Company alloc]initWithName:@"Apple" Image:@"img-companyLogo_Apple.png" Stock:@"AAPL" Products: appleProducts];
        NSMutableArray *twitterProducts = [[NSMutableArray alloc]initWithObjects:tweetDeck, uberTwitter, twitterAlerts, nil];
        Company *twitter = [[Company alloc]initWithName:@"Twitter" Image:@"img-companyLogo_Twitter.png" Stock:@"TWTR" Products: twitterProducts];
        NSMutableArray *teslaProducts = [[NSMutableArray alloc]initWithObjects:modelS, modelX, model3, nil];
        Company *tesla = [[Company alloc]initWithName:@"Tesla" Image:@"img-companyLogo_Tesla.png" Stock:@"TSLA" Products: teslaProducts];
        NSMutableArray *googleProducts = [[NSMutableArray alloc]initWithObjects:googleMaps, googleAdwords, gmail, nil];
        Company *google = [[Company alloc]initWithName:@"Google" Image:@"img-companyLogo_Google.png" Stock:@"GOOGL" Products: googleProducts];
        
        _companies = [[NSMutableArray alloc] initWithObjects:apple, twitter, tesla, google, nil] ;
     
    }
    return self;
}
-(void)getStockPrice
{
    NSString *urlString = @"http://finance.yahoo.com/d/quotes.csv?s=";
    
    NSMutableArray *stockSymbols = [[NSMutableArray alloc] init];
    for (Company *company in self.companies) {
        [stockSymbols addObject:company.stockSymbol];
    }
    NSString *stockSymbolSeparator = [stockSymbols componentsJoinedByString:@"+"];
    urlString = [[urlString stringByAppendingString:stockSymbolSeparator] stringByAppendingString:@"&f=a"];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *urlReq = [NSMutableURLRequest requestWithURL:url];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:urlReq completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error != nil) {
                if (error.code == NSURLErrorNotConnectedToInternet) {
                    UIAlertController *errorAlert;
                    errorAlert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Internet not connected" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
                    [errorAlert addAction:defaultAction];
                }
            }
        });
        if (!error) {
            NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSArray *stockPrices = [dataString componentsSeparatedByString:@"\n"];
            NSLog(@"%@", stockPrices);
            
            for (int i = 0; i < stockPrices.count; i++) {
                for (i = 0; i < [self.companies count]; i++) {
                    Company *company = [self.companies objectAtIndex:i];
                    company.stockPrice = stockPrices[i];
                }
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [[NSNotificationCenter defaultCenter]
                 postNotificationName:@"Stock Price Loaded"
                 object:self];
            });
            
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
        
    }];
    [task resume];
 
}


//- (void)dealloc {
//    // Should never be called, but just here for clarity really.
//}



@end


