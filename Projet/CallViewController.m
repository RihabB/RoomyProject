//
//  CallViewController.m
//  Projet
//
//  Created by opc on 17/08/2016.
//  Copyright © 2016 opc. All rights reserved.
//

#import "CallViewController.h"






@interface CallViewController ()

@end

@implementation CallViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    [QBRTCClient.instance addDelegate:self]; // self class must conform to QBRTCClientDelegate protocol
    
   
    NSArray *opponentsIDs = @[@16441644, @16443434];
    QBRTCSession *newSession = [QBRTCClient.instance createNewSessionWithOpponents:opponentsIDs
                                                                withConferenceType:QBRTCConferenceTypeVideo];
    // userInfo - the custom user information dictionary for the call. May be nil.
    NSDictionary *userInfo = @{ @"" : @"" };
    [newSession startCall:userInfo];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}








@end
