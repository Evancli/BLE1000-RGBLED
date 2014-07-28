//
//  ColorSelectionButton.m
//  ColorSignBLE
//
//  Created by Evan Li on 2/25/14.
//  Copyright (c) 2014 EL. All rights reserved.
//

#import "ColorSelectionButton.h"


#import <STColorPicker.h>
#import <FPPopoverController.h>
#import "PopoverViewController.h"

@implementation ColorSelectionButton

@synthesize defaultColor;
@synthesize currentColor;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        self.layer.borderWidth = 1;
        self.layer.cornerRadius = 15;
        
        self.backgroundColor = [UIColor lightGrayColor];
        
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPopover)]];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        self.layer.borderWidth = 1;
        self.layer.cornerRadius = 15;
        
        self.backgroundColor = [UIColor lightGrayColor];
        
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPopover)]];
    }
    return self;
}

- (void)showPopover
{
    vc = [PopoverViewController new];
    
    STColorPicker *colorPicker = [[STColorPicker alloc] initWithFrame:CGRectMake(0.0, 0.0, 200.0, 200.0)];
    [colorPicker setColorHasChanged:^(UIColor *color, CGPoint location) {
        self.backgroundColor = color;
        currentColor = color;
        if (setColorHasChanged != nil) {
            setColorHasChanged(color, location);
        }
    }];
    
    [vc.view addSubview:colorPicker];
    
    popover = [[FPPopoverController alloc] initWithViewController:vc];
    popover.contentSize = CGSizeMake(200,200);
    popover.border = NO;
    popover.tint = FPPopoverWhiteTint;
    popover.delegate = vc;
    [popover presentPopoverFromView:self];
}

- (void)setDefaultColor:(UIColor *)dc
{
    self.backgroundColor = dc;
    defaultColor = dc;
    currentColor = defaultColor;
}

- (void)setCurrentColor:(UIColor *)dc
{
    self.backgroundColor = dc;
    currentColor = dc;
}

- (void)setColorHasChanged:(void (^)(UIColor *, CGPoint))actionHandler
{
    setColorHasChanged = actionHandler;
}

@end
