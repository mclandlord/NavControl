//
//  AddCompanyViewController.m
//  NavCtrl
//
//  Created by Aditya Narayan on 9/15/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "AddCompanyViewController.h"


@interface AddCompanyViewController ()

@end

@implementation AddCompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //[self.navigationController popViewControllerAnimated:YES];
    
    UIBarButtonItem* saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self
                                                                  action:@selector(saveButtonPressed:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    [saveButton release];
    
}

-(void)saveButtonPressed:(id)sender{

    
//    NSMutableArray *newCompany = [[NSMutableArray alloc]initWithObjects:_companyName, _stockSymbol, _companyImageFile, nil];
//    Company *apple = [[Company alloc]initWithName:@"Apple" Image:@"img-companyLogo_Apple.png" Products: appleProducts];
    
    Company *newCompany = [[Company alloc]initWithName:self.companyName.text Image:self.companyImageFile.text  Stock:self.stockSymbol.text Products: nil];

    DAO *dataAccessObject = [DAO sharedManager];

    [dataAccessObject.companies addObject:newCompany];
    
    [self.navigationController popViewControllerAnimated:YES];
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
    [_companyName release];
    [_stockSymbol release];
    [_companyImageFile release];
    [super dealloc];
}
@end
