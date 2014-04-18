//
//  MainDisplayViewController.m
//  AccelerationAndRotationTutorial
//
//  Created by Adam Thorson on 4/17/14.
//  Copyright (c) 2014 Adam Thorson. All rights reserved.
//

#import "MainDisplayViewController.h"

@interface MainDisplayViewController ()

@end

@implementation MainDisplayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    return self;
}


- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *resetButton = [[UIBarButtonItem alloc] initWithTitle:@"Reset" style:UIBarButtonItemStylePlain target:self action:@selector(resetClicked)];
    
    [self.navigationItem setRightBarButtonItem:resetButton];
    
    [self disableUITextFields];
    
    [self initMotionManager];
}


-(void)disableUITextFields{
    [self.accelX setEnabled:NO];
    [self.accelY setEnabled:NO];
    [self.accelZ setEnabled:NO];
    
    [self.rotatX setEnabled:NO];
    [self.rotatY setEnabled:NO];
    [self.rotatZ setEnabled:NO];
    
    [self.maxAccelX setEnabled:NO];
    [self.maxAccelY setEnabled:NO];
    [self.maxAccelZ  setEnabled:NO];
    
    [self.maxRotatX setEnabled:NO];
    [self.maxRotatY  setEnabled:NO];
    [self.maxRotatZ  setEnabled:NO];
}


-(void)initMotionManager{
    currentMaxAccelX = 0.0f;
    currentMaxAccelY = 0.0f;
    currentMaxAccelZ = 0.0f;
    
    currentMaxRotatX = 0.0f;
    currentMaxRotatY = 0.0f;
    currentMaxRotatZ = 0.0f;
    
    self.motionManager = [[CMMotionManager alloc] init];
    [self.motionManager setAccelerometerUpdateInterval:0.2f];
    [self.motionManager setGyroUpdateInterval:0.2f];
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
        [self outputAccelerationData:accelerometerData.acceleration];
        if(error)
            NSLog(@"%@", error);
    }];
    
    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMGyroData *gyroData, NSError *error){
        [self outputRotationData:gyroData.rotationRate];
    }];
}


-(void)outputAccelerationData:(CMAcceleration)acceleration{
    [self.accelX setText:[NSString stringWithFormat:@"%.2fg", acceleration.x]];
    [self.accelY setText:[NSString stringWithFormat:@"%.2fg", acceleration.y]];
    [self.accelZ setText:[NSString stringWithFormat:@"%.2fg", acceleration.z]];
    
    if(fabs(acceleration.x) > fabs(currentMaxAccelX))
        currentMaxAccelX = acceleration.x;
    if(fabs(acceleration.y) > fabs(currentMaxAccelY))
        currentMaxAccelY = acceleration.y;
    if(fabs(acceleration.z) > fabs(currentMaxAccelZ))
        currentMaxAccelZ = acceleration.z;
    
    [self.maxAccelX setText:[NSString stringWithFormat:@"%.2fg", currentMaxAccelX]];
    [self.maxAccelY setText:[NSString stringWithFormat:@"%.2fg", currentMaxAccelY]];
    [self.maxAccelZ setText:[NSString stringWithFormat:@"%.2fg", currentMaxAccelZ]];
}


-(void)outputRotationData:(CMRotationRate)rotation{
    [self.rotatX setText:[NSString stringWithFormat:@"%.2fg", rotation.x]];
    [self.rotatY setText:[NSString stringWithFormat:@"%.2fg", rotation.y]];
    [self.rotatZ setText:[NSString stringWithFormat:@"%.2fg", rotation.z]];
    
    if(fabs(rotation.x) > fabs(currentMaxRotatX))
        currentMaxRotatX = rotation.x;
    if(fabs(rotation.y) > fabs(currentMaxRotatY))
        currentMaxRotatY = rotation.y;
    if(fabs(rotation.z) > fabs(currentMaxRotatZ))
        currentMaxRotatZ = rotation.z;
    
    [self.maxRotatX setText:[NSString stringWithFormat:@"%.2fg", currentMaxRotatX]];
    [self.maxRotatY setText:[NSString stringWithFormat:@"%.2fg", currentMaxRotatY]];
    [self.maxRotatZ setText:[NSString stringWithFormat:@"%.2fg", currentMaxRotatZ]];
}


-(IBAction)resetClicked{
    NSLog(@"Reset Clicked");
    
    currentMaxRotatX = 0.0f;
    currentMaxRotatY = 0.0f;
    currentMaxRotatZ = 0.0f;
    
    currentMaxAccelX = 0.0f;
    currentMaxAccelY = 0.0f;
    currentMaxAccelZ = 0.0f;
}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
