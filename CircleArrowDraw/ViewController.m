//
//  ViewController.m
//  CircleArrowDraw
//
//  Created by Adam Johns on 1/28/15.
//  Copyright (c) 2015 Adam Johns. All rights reserved.
//

#import "ViewController.h"
#import "CircleArrowView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *circleArrowView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.circleArrowView.backgroundColor = [UIColor clearColor];
}

@end
