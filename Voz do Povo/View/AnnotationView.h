//
//  AnnotationView.h
//  Voz do Povo
//
//  Created by Gabriel Moraes on 31/03/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ocorrencia.h"
#import "Obra.h"

@import MapKit;

@interface AnnotationView : MKAnnotationView <MKAnnotation>

@property (nonatomic, strong) Ocorrencia* ocorrencia;
@property (nonatomic, strong) Obra* obra;

@property(nonatomic, assign) CLLocationCoordinate2D coordinate;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *subtitle;

@end
