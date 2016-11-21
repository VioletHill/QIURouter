//
//  QIUViewController.m
//  QIURouter
//
//  Created by QiuFeng on 11/21/2016.
//  Copyright (c) 2016 QiuFeng. All rights reserved.
//

#import "QIUViewController.h"
#import "QIURouter.h"

@interface QIUViewController ()

@end

@implementation QIUViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushButtonTouchUpInside:(UIButton *)sender {
    [QIURouter open:@"second" params:@{@"text": @"Param from ViewControlelr",
                                       @"viewControllerTitle": @"titleFromFirstViewController"} withViewController:self];
}

@end
