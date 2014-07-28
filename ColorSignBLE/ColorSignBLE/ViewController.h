//
//  ViewController.h
//  ColorSignBLE
//
//  Created by Evan Li on 2/25/14.
//  Copyright (c) 2014 EL. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LinkedView;

@interface ViewController : UIViewController
{
    NSMutableArray *colorSelectorArray;
    BOOL isLinked;
    
    LinkedView *linkView;
    
    UIButton *linkButton;
    UIButton *rainbowButton;
    UIButton *rainbowCycleButton;
    
    UIButton *settingsButton;
}
@end
