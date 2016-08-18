//
//  HomeController.m
//  Projet
//
//  Created by opc on 12/08/2016.
//  Copyright © 2016 opc. All rights reserved.
//

#import "HomeController.h"
#import "Projet-Swift.h"


@interface HomeController ()

@end

@implementation HomeController

SocketIOClient*  s=nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
    
    
    NSURL* url = [[NSURL alloc] initWithString:@"https://roomyserver2.herokuapp.com"];
    
    
    s = [[SocketIOClient alloc] initWithSocketURL:url options:@{@"log": @YES, @"forcePolling": @YES}];
    
    [s on:@"connect" callback:^(NSArray* data, SocketAckEmitter* ack) {
        NSLog(@"socket connected");
    }];
    
    //    [socket emit:@"chat" withItems:@[@"heyy"]];
    
    
    [s on:@"message" callback:^(NSArray* data, SocketAckEmitter* ack) {
        
        [s emit:@"chat" withItems:@[@"heyy"]];
        
        
    }];
    
    [s connect];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

