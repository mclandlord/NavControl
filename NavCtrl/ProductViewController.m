//
//  ProductViewController.m
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import "ProductViewController.h"



@interface ProductViewController ()

@end

@implementation ProductViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.appleProd = [[NSMutableArray alloc] initWithObjects:@"appleipad.gif", @"appleipodtouch.gif", @"appleiphone.jpg", nil];
    self.twitterProd = [[NSMutableArray alloc] initWithObjects:@"tweetdeck.jpg", @"ubertwitter.jpg", @"twitteralert.png", nil];
    self.teslaProd = [[NSMutableArray alloc] initWithObjects:@"teslamodelS.jpg", @"teslamodelX.jpg", @"teslamodel3.jpg", nil];
    self.googleProd = [[NSMutableArray alloc] initWithObjects:@"Google_Maps_Icon.png", @"google-adwords-logo.png", @"google_gmail.png", nil];
//    self.products = [[NSMutableArray alloc]init];
    
//    self.appleProd = @[@"appleipad.gif", @"appleipodtouch.gif", @"appleiphone.jpg"];
//    self.twitterProd = @[@"tweetdeck.jpg", @"ubertwitter.jpg", @"twitteralert.png"];
//    self.teslaProd = @[@"teslamodelS.jpg", @"teslamodelX.jpg", @"teslamodel3.jpg"];
//    self.googleProd = @[@"Google_Maps_Icon.png", @"google-adwords-logo.png", @"google_gmail.png"];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    if ([self.title isEqualToString:@"Apple products"]) {
      //  [self.products addObjectsFromArray:@[@"iPad", @"iPod Touch",@"iPhone"]];
    self.products = [[NSMutableArray alloc] initWithObjects:@"iPad", @"iPod Touch",@"iPhone", nil];

    }else if ([self.title isEqualToString:@"Twitter products"]) {
     //   [self.products addObjectsFromArray:@[@"TweetDeck", @"Uber Twitter",@"Twitter Alerts"]];
    self.products = [[NSMutableArray alloc] initWithObjects:@"TweetDeck", @"Uber Twitter",@"Twitter Alerts", nil];
        
    }else if ([self.title isEqualToString:@"Tesla products"]) {
    //    [self.products addObjectsFromArray:@[@"Model S", @"Model X",@"Model 3"]];
    self.products = [[NSMutableArray alloc] initWithObjects:@"Model S", @"Model X",@"Model 3", nil];
   
    }else if ([self.title isEqualToString:@"Google products"]) {
    //    [self.products addObjectsFromArray:@[@"Google Maps", @"Google Adwords",@"Gmail"]];
    self.products = [[NSMutableArray alloc] initWithObjects:@"Google Maps", @"Google Adwords",@"Gmail", nil];
    }
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    cell.textLabel.text = [self.products objectAtIndex:[indexPath row]];
    
    if ([self.title isEqualToString:@"Apple products"]) {
        
        cell.imageView.image = [UIImage imageNamed:[self.appleProd objectAtIndex:indexPath.row]];
        
    } else if ([self.title isEqualToString:@"Twitter products"]) {
        
       cell.imageView.image = [UIImage imageNamed:[self.twitterProd objectAtIndex:indexPath.row]];
        
    }else if ([self.title isEqualToString:@"Tesla products"]) {
        
       cell.imageView.image = [UIImage imageNamed:[self.teslaProd objectAtIndex:indexPath.row]];
        
    }else if ([self.title isEqualToString:@"Google products"]) {
        
        cell.imageView.image = [UIImage imageNamed:[self.googleProd objectAtIndex:indexPath.row]];
    }
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView beginUpdates];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
       [self.products removeObjectAtIndex:indexPath.row];
       [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        [tableView reloadData];
    }
    [tableView endUpdates];
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
 NSString *moveTable = [self.products objectAtIndex:fromIndexPath.row];
 [self.products removeObjectAtIndex:fromIndexPath.row];
 [self.products insertObject:moveTable atIndex:toIndexPath.row];
 
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        NSString *productName = [self.products objectAtIndex:[indexPath row]];
    
        if ([productName isEqualToString:@"iPad"])
        {
        self.productUrl = @"https://www.apple.com/ipad";
        }

        else if ([productName isEqualToString:@"iPod Touch"])
        {
            self.productUrl = @"https://www.apple.com/ipod";
        }
        
        else if ([productName isEqualToString:@"iPhone"])
        {
            self.productUrl = @"https://www.apple.com/iphone";
        }
    
        else if ([productName isEqualToString:@"TweetDeck"])
        {
            self.productUrl = @"https://tweetdeck.twitter.com";
        }
        else if ([productName isEqualToString:@"Uber Twitter"])
        {
            self.productUrl = @"https://twitter.com/uber";
        }
        
        else if ([productName isEqualToString:@"Twitter Alerts"])
        {
            self.productUrl = @"https://about.twitter.com/products/alerts";
        }

        else if ([productName isEqualToString:@"Model S"])
        {
            self.productUrl = @"https://www.tesla.com/models";
        }
        else if ([productName isEqualToString:@"Model X"])
        {
            self.productUrl = @"https://www.tesla.com/modelx";
        }
        
        else if ([productName isEqualToString:@"Model 3"])
        {
            self.productUrl = @"https://www.tesla.com/model3";
        }

        else if ([productName isEqualToString:@"Google Maps"])
        {
            self.productUrl = @"https://www.google.com/maps";
        }
        else if ([productName isEqualToString:@"Google Adwords"])
        {
            self.productUrl = @"https://www.google.com/adwords/";
        }
        
        else if ([productName isEqualToString:@"Gmail"])
        {
            self.productUrl = @"https://mail.google.com";
        }
    
    // Create the next view controller.

    WebViewController *webViewControllerLocal = [[WebViewController alloc] init];
    webViewControllerLocal.URL = self.productUrl;
    [self.navigationController pushViewController:webViewControllerLocal animated:YES];
    [webViewControllerLocal release];

    
    // NSURL *nsurl=[NSURL URLWithString:self.productUrl];
    // [NSURL URLWithString: nsurl];
    // Pass the selected object to the new view controller.
    // [self.webViewController loadRequest:[NSURLRequest requestWithURL:nsurl]];
    // Push the view controller.
    
    }

@end
