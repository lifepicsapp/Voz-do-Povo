//
//  CustomNavigationController.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 12/12/13.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "CustomNavigationController.h"

@implementation CustomNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    UIColor* color = [UIColor blackColor];
    UIColor* colorItems = [UIColor whiteColor];
    
    self.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                              colorItems,NSForegroundColorAttributeName,
                                              colorItems,NSBackgroundColorAttributeName,nil];
    
    self.navigationBar.barTintColor = color;
    self.navigationBar.tintColor = colorItems;
    self.toolbar.barTintColor = color;
    self.toolbar.tintColor = colorItems;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
