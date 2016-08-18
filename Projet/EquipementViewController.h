//
//  EquipementViewController.h
//  Projet
//
//  Created by opc on 17/08/2016.
//  Copyright © 2016 opc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EquipementViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *listeEquip;

@end
