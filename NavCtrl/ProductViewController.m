//
//  ProductViewController.m
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import "ProductViewController.h"
#import "AddProductViewController.h"



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
    self.DataAccessObject = [DAO sharedManager];

    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
   
    
   // self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem* addButton = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self
                                                                 action:@selector(addButtonPressed:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.navigationItem.rightBarButtonItems = @[self.editButtonItem, addButton];
    
    [addButton release];

    [self.tableView setAllowsSelectionDuringEditing:true]; // Permit selection of rows while in editing mode.
        
}

-(void)addButtonPressed:(id)sender{
    NSLog(@"Add Pressed");
    
    
    AddProductViewController *addProductViewController = [[AddProductViewController alloc] init];
    addProductViewController.isEditMode = NO;
    [self.navigationController pushViewController:addProductViewController animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    
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
    return [self.company.products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    cell.textLabel.text = [[self.company.products objectAtIndex:indexPath.row] productName];
    UIImage *unscaledImage = [UIImage imageNamed:[[self.company.products objectAtIndex:[indexPath row]] productImageString]];
    cell.imageView.image = [self reSizeImage:unscaledImage toSize:CGSizeMake(50,50)];
    
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
       [self.company.products removeObjectAtIndex:indexPath.row];
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
 Product *productToBeMoved = [self.company.products objectAtIndex:fromIndexPath.row];
 [self.company.products removeObjectAtIndex:fromIndexPath.row];
 [self.company.products insertObject:productToBeMoved atIndex:toIndexPath.row];
 
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
    NSString *productURL = [[self.company.products objectAtIndex:indexPath.row] productUrlString];
    Product *currentProduct = [self.company.products objectAtIndex:indexPath.row];
    
    if (self.tableView.editing){
        //go to edit view
        NSLog(@"EDIT");
        
    AddProductViewController *prodView = [[AddProductViewController alloc] init];
        prodView.isEditMode = YES;
        prodView.productToEdit = currentProduct;
    
    [self.navigationController pushViewController:prodView animated:YES];
    [prodView release];
        
        
    } else {
        // go to webview
        NSLog(@"Webview");
        
        
    WebViewController *webViewControllerLocal = [[WebViewController alloc] init];
    webViewControllerLocal = [[WebViewController alloc] init];
    
    webViewControllerLocal.URL = productURL;
    [self.navigationController pushViewController:webViewControllerLocal animated:YES];
    [webViewControllerLocal release];
        
    }
    
    // NSURL *nsurl=[NSURL URLWithString:self.productUrl];
    // [NSURL URLWithString: nsurl];
    // Pass the selected object to the new view controller.
    // [self.webViewController loadRequest:[NSURLRequest requestWithURL:nsurl]];
    // Push the view controller.
    
    }

- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize
{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return reSizeImage;
}

@end
