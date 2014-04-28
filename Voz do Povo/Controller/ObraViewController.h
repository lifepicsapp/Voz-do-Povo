//
//  ObraViewController.h
//  Voz do Povo
//
//  Created by Gabriel Moraes on 28/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnnotationView.h"

@import MapKit;

@interface ObraViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) NSMutableArray* arrAnnotations;
@property (nonatomic,strong) AnnotationView* annotation;
@property (assign) BOOL updated;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *btnLocalizacao;

@end
