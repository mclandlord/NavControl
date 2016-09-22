//
//  AddProductViewController.m
//  NavCtrl
//
//  Created by Aditya Narayan on 9/15/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "AddProductViewController.h"

@interface AddProductViewController ()

@end

@implementation AddProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if(self.isEditMode){
        self.productName.text = self.productToEdit.productName;
        self.productURL.text = self.productToEdit.productUrlString;
        self.productImageFile.text = self.productToEdit.productImageString;
        //same for image textfield
    }
    
    UIBarButtonItem* saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self
                                                                 action:@selector(saveButtonPressed:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    [saveButton release];

}

-(void)saveButtonPressed:(id)sender{
    
    
    if(!self.isEditMode){
    Product *newProduct = [[Product alloc]initWithName:self.productName.text imageString:self.productImageFile.text urlString:self.productURL.text];
    
    DAO *dataAccessObject = [DAO sharedManager];
    
    // company where the product will be added
    // add product to company->products mutable array
    
    [dataAccessObject.products addObject:newProduct];
    [self.navigationController popViewControllerAnimated:YES];
   
    } else {
        self.productToEdit.productName = self.productName.text;
        self.productToEdit.productUrlString = self.productURL.text;
        self.productToEdit.productImageString = self.productImageFile.text;
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [_productName release];
    [_productURL release];
    [_productImageFile release];
    
    [super dealloc];
}
@end
