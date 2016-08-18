//
//  InscritViewController.h
//  Projet
//
//  Created by opc on 15/08/2016.
//  Copyright © 2016 opc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "TextFieldValidator.h"

@interface InscritViewController : UIViewController

@property (weak, nonatomic) IBOutlet TextFieldValidator *user;

@property (weak, nonatomic) IBOutlet TextFieldValidator *mdp;
@property (weak, nonatomic) IBOutlet TextFieldValidator *reMDP;
@property (weak, nonatomic) IBOutlet TextFieldValidator *IDrobot;


- (IBAction)inscrit:(id)sender;


@end
