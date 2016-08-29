//
//  CompanyViewController.m
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import "CompanyViewController.h"
#import "ProductViewController.h"


@interface CompanyViewController ()

@end

@implementation CompanyViewController

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
    self.DataAccessObject = [DAO sharedManager];

    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    

    
//  self.companyList = [[NSMutableArray alloc] init];
//  [self.companyList addObjectsFromArray:@[@"Apple",@"Twitter", @"Tesla", @"Google", nil]];
//  self.companyList = @[@"Apple",@"Twitter", @"Tesla", @"Google"];
    
//    self.companyList = [[NSMutableArray alloc] initWithObjects:@"Apple",@"Twitter", @"Tesla", @"Google", nil];
    self.title = @"Watch List";
//    self.imageList = [[NSMutableArray alloc] initWithObjects:@"img-companyLogo_Apple.png", @"img-companyLogo_Twitter.png", @"img-companyLogo_Tesla.png", @"img-companyLogo_Google.png", nil];
    
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
    return [self.companyList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    cell.textLabel.text = [self.companyList objectAtIndex:[indexPath row]];
    cell.imageView.image = [UIImage imageNamed:[self.imageList objectAtIndex:indexPath.row]];
    
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
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.companyList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
 NSString *moveTable = [self.companyList objectAtIndex:fromIndexPath.row];
 [self.companyList removeObjectAtIndex:fromIndexPath.row];
 [self.companyList insertObject:moveTable atIndex:toIndexPath.row];
 
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

    NSString *companyName = [self.companyList objectAtIndex:[indexPath row]];
    
    if ([companyName isEqual: @"Apple"]){
        self.productViewController.title = @"Apple products";
        
    } else if ([companyName isEqual: @"Twitter"])
    {
        self.productViewController.title = @"Twitter products";
    }else if ([companyName isEqual: @"Tesla"])
    {
        self.productViewController.title = @"Tesla products";
    }else if ([companyName isEqual: @"Google"])
    {
        self.productViewController.title = @"Google products";
    }

/*
    if (indexPath.row == 0){
        self.productViewController.title = @"Apple products";
    } else if (indexPath.row == 1)
        {
        self.productViewController.title = @"Twitter products";
        }else if (indexPath.row == 2)
            {
        self.productViewController.title = @"Tesla products";
        }else if (indexPath.row == 3)
            {
        self.productViewController.title = @"Google products";
    }
*/
    [self.navigationController
        pushViewController:self.productViewController
        animated:YES];
}
 


@end
