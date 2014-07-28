//
//  PopoverViewController.m
//  ColorSignBLE
//
//  Created by Evan Li on 2/25/14.
//  Copyright (c) 2014 EL. All rights reserved.
//

#import "PopoverViewController.h"
#import <FPPopoverController.h>

@interface PopoverViewController ()

@end

@implementation PopoverViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)presentedNewPopoverController:(FPPopoverController *)newPopoverController
          shouldDismissVisiblePopover:(FPPopoverController*)visiblePopoverController
{
    
}

- (void)popoverControllerDidDismissPopover:(FPPopoverController *)popoverController
{
    
}

@end
