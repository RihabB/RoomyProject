//
//  ViewController.h
//  Projet
//
//  Created by opc on 11/08/2016.
//  Copyright © 2016 opc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "TextFieldValidator.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *user;

@property (weak, nonatomic) IBOutlet UITextField *pass;

- (IBAction)connexion:(id)sender;



@end

