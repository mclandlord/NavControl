//
//  AddCompanyViewController.h
//  NavCtrl
//
//  Created by Aditya Narayan on 9/15/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAO.h"
#import "Company.h"
#import "Product.h"


@interface AddCompanyViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *companyName;


@property (retain, nonatomic) IBOutlet UITextField *stockSymbol;


@property (retain, nonatomic) IBOutlet UITextField *companyImageFile;


@end
