//
//  CircleArrowView.m
//  CircleArrowDraw
//
//  Created by Adam Johns on 1/28/15.
//  Copyright (c) 2015 Adam Johns. All rights reserved.
//

#import "CircleArrowView.h"

@interface CircleArrowView ()
@property (strong, nonatomic) UIColor *circleColor;
@end

@implementation CircleArrowView

- (void)drawRect:(CGRect)rect {
    UIBezierPath *circleOutline = [UIBezierPath bezierPath];
    
    [self.circleColor setStroke];
    [circleOutline setLineWidth:self.bounds.size.width*0.15];
    [circleOutline addArcWithCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:self.bounds.size.width/2-circleOutline.lineWidth/2 startAngle:3*M_PI/2 endAngle:3*M_PI/4 clockwise:YES];
    [circleOutline stroke];
    
    [self addArrowView:circleOutline];
}

- (void)addArrowView:(UIBezierPath *)path {
    for (int x = 0; x < self.bounds.size.width/2; x++) {
        for (int y = self.bounds.size.height/2; y < self.bounds.size.height; y++) {
            if ([path containsPoint:CGPointMake(x, y)]) {
                
                // Pythagorean Theorem - We want the diagonal length of the square to be lineWidth, so we need to calculate what size
                // to make each side of the square to make the diagonal equal to lineWidth
                double sideLength = sqrt((path.lineWidth*path.lineWidth)/2);
                
                UIView *arrowView = [[UIView alloc] initWithFrame:CGRectMake(x-sideLength/2, y-sideLength/2, sideLength, sideLength)];
                arrowView.backgroundColor = self.circleColor;
                [self addSubview:arrowView];
                
                return;
            }
        }
    }
}

- (UIColor *)circleColor {
    return [UIColor orangeColor];
}

@end
