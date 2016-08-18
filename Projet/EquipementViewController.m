//
//  EquipementViewController.m
//  Projet
//
//  Created by opc on 17/08/2016.
//  Copyright © 2016 opc. All rights reserved.
//

#import "EquipementViewController.h"
#import "Projet-Swift.h"


@interface EquipementViewController ()


@end

@implementation EquipementViewController


SocketIOClient*  s=nil;
NSArray *data =nil;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    _listeEquip = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, 0, 0)];
    
    [_listeEquip setDataSource: self];
    [_listeEquip setDelegate: self];
    _listeEquip.showsSelectionIndicator = YES;
    
    UIToolbar *pickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    pickerToolbar.barStyle = UIBarStyleBlackOpaque;
    [pickerToolbar sizeToFit];
    
    
    
    [_listeEquip addSubview:pickerToolbar];
    [_listeEquip addSubview:_listeEquip];
    [_listeEquip setBounds:CGRectMake(0,0,320, 464)];



  
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





-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    return [data count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return [data objectAtIndex: row];
}

@end
