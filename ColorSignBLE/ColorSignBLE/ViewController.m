//
//  ViewController.m
//  ColorSignBLE
//
//  Created by Evan Li on 2/25/14.
//  Copyright (c) 2014 EL. All rights reserved.
//

#import "ViewController.h"
#import "LinkedView.h"
#import "ColorSelectionButton.h"

#define kRadius 140


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	colorSelectorArray = [NSMutableArray arrayWithCapacity:24];
    
    linkView = [[LinkedView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    linkView.hidden = YES;
    [self.view addSubview:linkView];
    
    float xCenter = self.view.frame.size.width / 2;;
    float yCenter = self.view.frame.size.height / 2;
    
    linkView.center = CGPointMake(xCenter, yCenter);
    
    for (int i = 0; i < 24; i++) {
        double angle = (2 * M_PI /  24) * i;
        
        ColorSelectionButton *colorSelectionButton = [[ColorSelectionButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        
        float x = kRadius*cos(angle) + xCenter;
        float y = kRadius*sin(angle) + yCenter;
        
        colorSelectionButton.center = CGPointMake(x, y);
        
        [colorSelectionButton setDefaultColor:[UIColor blackColor]];
        
        [colorSelectionButton setColorHasChanged:^(UIColor *color, CGPoint location) {
            if (isLinked) {
                [self changeAllColors:color];
            }
        }];
        
        [colorSelectorArray addObject:colorSelectionButton];
        
        [self.view addSubview:colorSelectionButton];
    }
    

    
    
    linkButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [linkButton setImage:[UIImage imageNamed:@"secure"] forState:UIControlStateNormal];
    linkButton.center = CGPointMake(80 * cos(M_PI / 2) + xCenter, 80 * sin(M_PI / 2) + yCenter);
    [linkButton addTarget:self action:@selector(linkButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:linkButton];
    
    rainbowButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [rainbowButton setImage:[UIImage imageNamed:@"refresh"] forState:UIControlStateNormal];
    rainbowButton.center = CGPointMake(80 * cos((M_PI / 2) + M_PI / 6 ) + xCenter, 80 * sin((M_PI / 2) + M_PI / 6 ) + yCenter);
    [rainbowButton addTarget:self action:@selector(rainbowButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rainbowButton];
    
    rainbowCycleButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [rainbowCycleButton setImage:[UIImage imageNamed:@"replay"] forState:UIControlStateNormal];
    rainbowCycleButton.center = CGPointMake(80 * cos((M_PI / 2) - M_PI / 6 ) + xCenter, 80 * sin((M_PI / 2) - M_PI / 6 ) + yCenter);
    [rainbowCycleButton addTarget:self action:@selector(rainbowCycleButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rainbowCycleButton];
    
    settingsButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [settingsButton setImage:[UIImage imageNamed:@"settings"] forState:UIControlStateNormal];
    settingsButton.center = CGPointMake(80 * cos(- M_PI / 2) + xCenter, 80 * sin(- M_PI / 2) + yCenter);
    [settingsButton addTarget:self action:@selector(settingsButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:settingsButton];
    
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)linkButtonAction
{
    isLinked = !isLinked;
    
    if (isLinked){
        linkView.hidden = NO;
        
        ColorSelectionButton *colorSelectionButton = [colorSelectorArray firstObject];
        
        [self changeAllColors: colorSelectionButton.currentColor];
        
    } else {
        linkView.hidden = YES;
    }
}

- (void)rainbowButtonAction
{
    
}

- (void)rainbowCycleButtonAction
{
    
}

- (void)settingsButtonAction
{
    
}

- (void)changeAllColors:(UIColor *) newColor
{
    for (ColorSelectionButton *colorSelectionButton in colorSelectorArray) {
        [colorSelectionButton setCurrentColor:newColor];
    }
}



@end
