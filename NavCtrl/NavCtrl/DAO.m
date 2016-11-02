//
//  DAO.m
//  NavCtrl
//
//  Created by Aditya Narayan on 8/24/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "DAO.h"
#import "ManagedCompany+CoreDataClass.h"
#import "ManagedProduct+CoreDataClass.h"

@implementation DAO

//@synthesize someProperty;

#pragma mark -
#pragma mark Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.sahlitude.coreDataTemplate" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"NavCtrl.sqlite"];
    NSLog(@"%@",storeURL);
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}



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
        _managedCompanies = [[NSMutableArray alloc]init];
        
        for(Company *company in self.companies){
            
            ManagedCompany *mC = [NSEntityDescription insertNewObjectForEntityForName:@"Mana" inManagedObjectContext:self.managedObjectContext];
            
            [mC setCompanyName:company.companyName];
            [mC setStockSymbol:company.stockSymbol];
            [mC setCompanyImageString:company.companyImageString];
            
            for (Product *product in company.products) {
                
                ManagedProduct *mP = [NSEntityDescription insertNewObjectForEntityForName:@"ManagedProduct" inManagedObjectContext:self.managedObjectContext];
                [mP setProductName:product.productName];
                [mP setProductURLString:product.productUrlString];
                [mP setProductImageString:product.productImageString];
                [mP setCompany:mC];
                [mC.products setByAddingObject:mP];
            }
            [self.managedCompanies addObject:mC];
        }
        
     
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


