//
//  JMGMainViewController.m
//  SampleProject
//
//  Created by Jorge Maroto García on 06/05/14.
//  Copyright (c) 2014 Jorge Maroto. All rights reserved.
//

#import "JMGMainViewController.h"
#import "UIViewController+BlockSegue.h"

#import "JMGUser.h"
#import "JMGSecondViewController.h"

@implementation JMGMainViewController

-(void)viewDidLoad {
    [super viewDidLoad];

    [self configureSegue:@"segue1" withBlock:^(id sender, id destinationVC, UIStoryboardSegue *segue) {
        NSLog(@"Segue configured fired from storyboard");
    }];
}


#pragma mark - UI Buttons

- (IBAction)showViewController:(id)sender {
    JMGUser *tmpUser = [[JMGUser alloc] init];
    tmpUser.name = @"Richard";
    tmpUser.surname = @"Gere";

    [self performSegueWithIdentifier:@"segue2"
                              sender:nil
                           withBlock:^(id sender, JMGSecondViewController *destinationVC, UIStoryboardSegue *segue) {
                               NSLog(@"Segue configured inline");
                               destinationVC.user = tmpUser;
                           }];
}

@end