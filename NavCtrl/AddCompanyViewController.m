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


- (void)registerForKeyboardNotifications {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}

- (void)deregisterFromKeyboardNotifications {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self registerForKeyboardNotifications];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self.view];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [self deregisterFromKeyboardNotifications];
    
    [super viewWillDisappear:animated];
    
}

- (void)keyboardWasShown:(NSNotification *)notification {
    
    [UIView animateWithDuration:0.3f animations:^ {
        self.view.frame = CGRectMake(0, 0, 480, 480);
    }];
}

- (void)keyboardWillBeHidden:(NSNotification *)notification {
    
    [UIView animateWithDuration:0.3f animations:^ {
        self.view.frame = CGRectMake(0, 0, 320, 480);
    }];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    // Do any additional setup after loading the view from its nib.
    //[self.navigationController popViewControllerAnimated:YES];
    
    if(self.isEditMode){
        self.companyName.text = self.companyToEdit.companyName;
        self.stockSymbol.text = self.companyToEdit.stockSymbol;
        self.companyImageFile.text = self.companyToEdit.companyImageString;
    }
    
    UIBarButtonItem* saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self
                                                                  action:@selector(saveButtonPressed:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    [saveButton release];
    
    }


-(void)animateTextField:(UITextField*)textField up:(BOOL)up withOffset:(CGFloat)offset
{
    const int movementDistance = -offset;
    const float movementDuration = 0.4f;
    int movement = (up ? movementDistance : -movementDistance);
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

-(void)saveButtonPressed:(id)sender{

    if(!self.isEditMode){
        
        Company *newCompany = [[Company alloc]initWithName:self.companyName.text Image:self.companyImageFile.text  Stock:self.stockSymbol.text Products: nil];
        DAO *dataAccessObject = [DAO sharedManager];
        [dataAccessObject.companies addObject:newCompany];
        [self.navigationController popViewControllerAnimated:YES];
        
    } else {
        self.companyToEdit.companyName = self.companyName.text;
        self.companyToEdit.stockSymbol = self.stockSymbol.text;
        self.companyToEdit.companyImageString = self.companyImageFile.text;
        [self.navigationController popViewControllerAnimated:YES];
    }

    
//    NSMutableArray *newCompany = [[NSMutableArray alloc]initWithObjects:_companyName, _stockSymbol, _companyImageFile, nil];
//    Company *apple = [[Company alloc]initWithName:@"Apple" Image:@"img-companyLogo_Apple.png" Products: appleProducts];
    
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
