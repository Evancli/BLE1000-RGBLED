//
//  ColorSelectionButton.h
//  ColorSignBLE
//
//  Created by Evan Li on 2/25/14.
//  Copyright (c) 2014 EL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class PopoverViewController;
@class FPPopoverController;

@interface ColorSelectionButton : UIView
{
    PopoverViewController *vc;
    FPPopoverController *popover;
    
    UIColor *defaultColor;
    UIColor *currentColor;
    
    void (^setColorHasChanged)(UIColor *, CGPoint);
}

@property (nonatomic, strong) UIColor *defaultColor;
@property (nonatomic, strong) UIColor *currentColor;

- (void)setColorHasChanged:(void (^)(UIColor *, CGPoint))actionHandler;
@end
