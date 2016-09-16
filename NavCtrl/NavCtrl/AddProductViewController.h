//
//  AddProductViewController.h
//  NavCtrl
//
//  Created by Aditya Narayan on 9/15/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAO.h"
#import "Company.h"
#import "Product.h"

@interface AddProductViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *productName;


@property (retain, nonatomic) IBOutlet UITextField *productURL;


@property (retain, nonatomic) IBOutlet UITextField *productImageFile;


@property (nonatomic, retain) Company *company;


@end
