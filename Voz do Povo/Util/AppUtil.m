//
//  AppUtil.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 28/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "AppUtil.h"

@implementation AppUtil

+(void)removeTextoBotaoVoltar:(UIViewController*)context
{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@""
                                   style:UIBarButtonItemStylePlain
                                   target:nil
                                   action:nil];
    context.navigationItem.backBarButtonItem=backButton;
}

+(void)rotaParaDestino:(CLLocationCoordinate2D)coordinate
{
    MKPlacemark* placeMark = [[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:nil];
    MKMapItem* destination =  [[MKMapItem alloc] initWithPlacemark:placeMark];
    
    if([destination respondsToSelector:@selector(openInMapsWithLaunchOptions:)])
    {
        [destination openInMapsWithLaunchOptions:@{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving}];
    }
    else
    {
        NSString* url = [NSString stringWithFormat: @"http://maps.google.com/maps?saddr=Current+Location&daddr=%f,%f", coordinate.latitude, coordinate.longitude];
        [[UIApplication sharedApplication] openURL: [NSURL URLWithString: url]];
    }
}

@end
