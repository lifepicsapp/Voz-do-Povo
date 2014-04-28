//
//  CustomAnnotation.h
//  Voz do Povo
//
//  Created by Gabriel Moraes on 13/02/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <Foundation/Foundation.h>

@import MapKit;

@interface CustomAnnotation : NSObject<MKAnnotation>

@property(nonatomic, assign) CLLocationCoordinate2D coordinate;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *subtitle;

@end
