//
//  ObraDetalheViewController.h
//  Voz do Povo
//
//  Created by Gabriel Moraes on 28/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnnotationView.h"

@interface ObraDetalheViewController : UIViewController

@property (nonatomic, retain, strong) AnnotationView* annotation;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *lblNome;
@property (weak, nonatomic) IBOutlet UILabel *lblData;
@property (weak, nonatomic) IBOutlet UILabel *lblTermino;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;
@property (weak, nonatomic) IBOutlet UITextView *txtDescricao;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIButton *btnRota;

@end
