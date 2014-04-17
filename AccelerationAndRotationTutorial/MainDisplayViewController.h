//
//  MainDisplayViewController.h
//  AccelerationAndRotationTutorial
//
//  Created by Adam Thorson on 4/17/14.
//  Copyright (c) 2014 Adam Thorson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>


@interface MainDisplayViewController : UIViewController<UITextFieldDelegate>

@property(nonatomic, strong)IBOutlet UITextField *accelX;
@property(nonatomic, strong)IBOutlet UITextField *accelY;
@property(nonatomic, strong)IBOutlet UITextField *accelZ;
@property(nonatomic, strong)IBOutlet UITextField *rotatX;
@property(nonatomic, strong)IBOutlet UITextField *rotatY;
@property(nonatomic, strong)IBOutlet UITextField *rotatZ;
@property(nonatomic, strong)IBOutlet UITextField *maxAccelX;
@property(nonatomic, strong)IBOutlet UITextField *maxAccelY;
@property(nonatomic, strong)IBOutlet UITextField *maxAccelZ;
@property(nonatomic, strong)IBOutlet UITextField *maxRotatX;
@property(nonatomic, strong)IBOutlet UITextField *maxRotatY;
@property(nonatomic, strong)IBOutlet UITextField *maxRotatZ;


-(IBAction)resetClicked;


@end
