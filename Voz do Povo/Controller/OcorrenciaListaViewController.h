//
//  OcorrenciaListaViewController.h
//  Voz do Povo
//
//  Created by Gabriel Moraes on 04/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OcorrenciaViewController.h"
#import "AnnotationView.h"
#import "OcorrenciaView.h"

@import CoreLocation;
@import MapKit;

@interface OcorrenciaListaViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, CLLocationManagerDelegate, HHPanningTableViewCellDelegate, OcorrenciaProtocol>

@property (nonatomic, strong, readonly) OcorrenciaViewController *barController;
@property (nonatomic,strong) CLLocation *myLocation;
@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) AnnotationView* annotation;
@property (nonatomic,strong) NSArray* arrFiltrado;
@property (assign) BOOL updateLocation;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end
