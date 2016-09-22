//
//  CompanyViewController.m
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import "CompanyViewController.h"
#import "ProductViewController.h"
#import "AddCompanyViewController.h"


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
    
    self.title = @"Watch List";
    
    self.DataAccessObject = [DAO sharedManager];
    self.companyList = self.DataAccessObject.companies;
    
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem* addButton = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self
                                                                  action:@selector(addButtonPressed:)];
    self.navigationItem.rightBarButtonItem = addButton;
    [addButton release];
    
    [self.tableView setAllowsSelectionDuringEditing:true];
    
    //  self.companyList = [[NSMutableArray alloc] init];
    //  [self.companyList addObjectsFromArray:@[@"Apple",@"Twitter", @"Tesla", @"Google", nil]];
    //  self.companyList = @[@"Apple",@"Twitter", @"Tesla", @"Google"];
    
    //    self.companyList = [[NSMutableArray alloc] initWithObjects:@"Apple",@"Twitter", @"Tesla", @"Google", nil];
    
    //    self.imageList = [[NSMutableArray alloc] initWithObjects:@"img-companyLogo_Apple.png", @"img-companyLogo_Twitter.png", @"img-companyLogo_Tesla.png", @"img-companyLogo_Google.png", nil];
    
}



-(void)addButtonPressed:(id)sender{
    NSLog(@"Add Pressed");

    AddCompanyViewController *addCompanyViewController = [[AddCompanyViewController alloc] init];
    addCompanyViewController.isEditMode = NO;
    [self.navigationController pushViewController:addCompanyViewController animated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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
    
    cell.textLabel.text = [[self.companyList objectAtIndex:[indexPath row]] companyName];
    cell.imageView.image = [UIImage imageNamed:[[self.companyList objectAtIndex:[indexPath row]] companyImageString]];
    
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
    Company *companyToBeMoved = [self.companyList objectAtIndex:fromIndexPath.row];
    [self.companyList removeObjectAtIndex:fromIndexPath.row];
    [self.companyList insertObject:companyToBeMoved atIndex:toIndexPath.row];
    
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
    

    Company *currentCompany = [self.companyList objectAtIndex:[indexPath row]];
//    self.DataAccessObject.products = company.products;
    
    
    if (self.tableView.editing){
        //go to edit view
        NSLog(@"EDIT");
        
        AddCompanyViewController *compView = [[AddCompanyViewController alloc] init];
        compView.isEditMode = YES;
        compView.companyToEdit = currentCompany;
        
        [self.navigationController pushViewController:compView animated:YES];
        [compView release];
        
        
    } else {
        // go to prodview
        NSLog(@"Product View");
        
    self.productViewController.company = currentCompany;
    self.productViewController.title = self.productViewController.company.companyName;
    
    [self.navigationController pushViewController:self.productViewController animated:YES];
}

}

@end
