//
//  JoyStick.h
//  Projet
//
//  Created by opc on 12/08/2016.
//  Copyright © 2016 opc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JoyStick : UIView
{


IBOutlet UIImageView *stickViewBase;
IBOutlet UIImageView *stickView;

UIImage *imgStickNormal;
UIImage *imgStickHold;

CGPoint mCenter;
float radius;

}
@end
