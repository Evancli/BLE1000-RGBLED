//
//  LinkedView.m
//  ColorSignBLE
//
//  Created by Evan Li on 6/24/14.
//  Copyright (c) 2014 EL. All rights reserved.
//

#import "LinkedView.h"

#define kRadius 140
#define kBorderWidth 30 
#define kColor [UIColor colorWithWhite:0.9 alpha:1.0]

@implementation LinkedView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        for (int i = 0; i < 24; i++) {
            double angle = (2 * M_PI /  24) * i;
            
            UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
            v.layer.cornerRadius = 20;
            v.backgroundColor = kColor;
            
            float x = kRadius*cos(angle) + self.center.x;
            float y = kRadius*sin(angle) + self.center.y;
            
            v.center = CGPointMake(x, y);
            
            [self addSubview:v];
            
        }
        
        UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kRadius * 2 + kBorderWidth, kRadius * 2 + kBorderWidth)];
        v2.backgroundColor = [UIColor clearColor];
        v2.center = self.center;
        v2.layer.cornerRadius = (kRadius * 2 + kBorderWidth) / 2;
        v2.layer.borderColor = [kColor CGColor];
        v2.layer.borderWidth = kBorderWidth;
        
        [self addSubview:v2];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
