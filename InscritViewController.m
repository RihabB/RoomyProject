//
//  InscritViewController.m
//  Projet
//
//  Created by opc on 15/08/2016.
//  Copyright © 2016 opc. All rights reserved.
//

#import "InscritViewController.h"
#import "AFNetworking.h"
#import <AFURLRequestSerialization.h>
#import <AFURLResponseSerialization.h>

@interface InscritViewController ()

@end

@implementation InscritViewController

@synthesize user;
@synthesize mdp;
@synthesize reMDP;
@synthesize IDrobot;



#define REGEX_USER_LIMIT @"^.{3,10}$"
#define REGEX_USER @"[A-Za-z0-9]{3,10}"
#define REGEX_EMAIL @"[A-Z0-9a-z._%+-]{3,}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
#define REGEX_MDP_LIMIT @"^.{6,20}$"
#define REGEX_MDP @"[A-Za-z0-9]{6,20}"


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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


-(BOOL) checkPasswordsMatch:(NSString*)password1 with:(NSString*)password2 {
    if([password1 isEqualToString:@""])
        return NO;
    else if ([password1 isEqualToString:password2]) {
        NSLog(@"match password");
        return YES;
    } else {
        NSLog(@"wrong password");
        return NO;
    }
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [textField setBackgroundColor:false];
    return YES;
}


-(void)setupAlerts{
    [user addRegx:REGEX_USER_LIMIT withMsg:@"User name charaters limit should be come between 3-10"];
    [user addRegx:REGEX_USER withMsg:@"Only alpha numeric characters are allowed."];
    user.validateOnResign=NO;
    
    [mdp addRegx:REGEX_MDP_LIMIT withMsg:@"Password characters limit should be come between 6-20"];
    [mdp addRegx:REGEX_MDP withMsg:@"Password must contain alpha numeric characters."];
    
    [reMDP addConfirmValidationTo:mdp withMsg:@"Confirm password didn't match."];
    
    
}



- (IBAction)inscrit:(id)sender {
    
    
    if([user validate] & [mdp validate] & [reMDP validate] & [IDrobot validate]){
     
            
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        
        NSURL *URL = [NSURL URLWithString:@"https://testroomie.herokuapp.com/authenticate/"];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
        
        [request setHTTPMethod:@"POST"];
        
        NSString *postString = [NSString stringWithFormat:@"username=%@&password=%@",user.text,mdp.text];
        
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








@end
