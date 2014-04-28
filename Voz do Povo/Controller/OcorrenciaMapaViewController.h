//
//  OcorrenciaMapaViewController.h
//  Voz do Povo
//
//  Created by Gabriel Moraes on 19/02/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OcorrenciaViewController.h"
#import "AnnotationView.h"

@import MapKit;

@interface OcorrenciaMapaViewController : UIViewController <MKMapViewDelegate, OcorrenciaProtocol>

@property (nonatomic, strong, readonly) OcorrenciaViewController *barController;
@property (nonatomic, strong) NSMutableArray* arrOcorrencias;
@property (nonatomic,strong) AnnotationView* annotation;
@property (assign) BOOL updated;
@property (assign) BOOL zoomEnabled;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *btnLocalizacao;

@end
