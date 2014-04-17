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


-(IBAction)resetClicked{
    NSLog(@"Reset Clicked");
}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
