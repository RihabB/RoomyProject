//
//  ViewController.m
//  Projet
//
//  Created by opc on 11/08/2016.
//  Copyright © 2016 opc. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import <AFURLRequestSerialization.h>
#import <AFURLResponseSerialization.h>

#define REGEX_USER_LIMIT @"^.{3,10}$"
#define REGEX_USER @"[A-Za-z0-9]{3,10}"
#define REGEX_MDP_LIMIT @"^.{6,20}$"
#define REGEX_MDP @"[A-Za-z0-9]{6,20}"

@interface ViewController ()

@end

@implementation ViewController


UIViewController *destViewController;




static NSString * const BaseURLString = @"https://testroomie.herokuapp.com";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//-(void)setupAlerts{
  //  [_user addRegx:REGEX_USER withMsg:@"Enter valid username."];
    //[_pass addRegx:REGEX_MDP_LIMIT  withMsg:@"Password characters limit should be come between 6-20"];
   // [_pass addRegx:REGEX_MDP_LIMIT  withMsg:@"Password must contain alpha numeric characters."];
    
//}





- (IBAction)connexion:(id)sender {
    if (![_pass isEqual:@""] && ![_user isEqual:@""] ){
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        
        NSURL *URL = [NSURL URLWithString:@"https://testroomie.herokuapp.com/authenticate/"];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
        
        [request setHTTPMethod:@"POST"];
        
        NSString *postString = [NSString stringWithFormat:@"username=%@&password=%@",_user.text,_pass.text];
        
        [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        
        NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
            
            if (error) {
                
                NSLog(@"Error: %@", error);
                
            } else {
                
                
                NSLog(@" %@",  responseObject);
                
                  if([[responseObject valueForKey:@"success"]intValue] == 1){
                
                UITabBarController *tbc = [self.storyboard instantiateViewControllerWithIdentifier:@"home"];
                tbc.selectedIndex=0;
                [self presentViewController:tbc animated:YES completion:nil];
                      
                  }
                  else {
                  
                      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Utilisateur invalide?"
                                                                      message:@"Erreur"
                                                                     delegate:self
                                                            cancelButtonTitle:@"Cancel"
                                                            otherButtonTitles:@"Ok",nil];
                      [alert show];
                
                  
                  
                  }

            }
            
        }];
        
        [dataTask resume];
    
    }}






-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if([segue.identifier isEqualToString:@"autorisation"])
        
    {
        
        destViewController = segue.destinationViewController;
    }
    
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if([_user.text isEqualToString:@""]|| [_pass.text isEqualToString:@""]){
        return false;
    }
    return true;

}





@end
