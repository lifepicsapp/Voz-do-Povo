//
//  AppUtil.h
//  Voz do Povo
//
//  Created by Gabriel Moraes on 28/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <Foundation/Foundation.h>

@import MapKit;

@interface AppUtil : NSObject

+(void)removeTextoBotaoVoltar:(UIViewController*)context;
+(void)rotaParaDestino:(CLLocationCoordinate2D)coordinate;

@end
