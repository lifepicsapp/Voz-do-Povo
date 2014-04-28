//
//  OcorrenciaMapaViewController.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 19/02/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "OcorrenciaMapaViewController.h"
#import "UIViewController+QuedaConexao.h"
#import "OcorrenciaDetalheViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation OcorrenciaMapaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self personalizaBotaoLocalizacao];
    
    self.mapView.showsUserLocation = YES;
    
    MKCoordinateRegion region;
    region.center = CLLocationCoordinate2DMake(-23.553602, -46.63221);
    MKCoordinateSpan span;
    span.latitudeDelta  = 0.05;
    span.longitudeDelta = 0.05;
    region.span = span;
    [self.mapView setRegion:region animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.barController.annotation)
    {
        self.zoomEnabled = YES;
        [self.mapView selectAnnotation:self.barController.annotation animated:YES];
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (self.barController.annotation)
    {
        [self.mapView deselectAnnotation:self.barController.annotation animated:YES];
        self.barController.annotation = nil;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"sgDetalheOcorrenciaMapa"])
    {
        OcorrenciaDetalheViewController* controller = segue.destinationViewController;
        controller.annotation = self.annotation;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Metodos de Classe

-(OcorrenciaViewController *)barController
{
    return (OcorrenciaViewController*)self.tabBarController;
}

- (void)personalizaBotaoLocalizacao
{
    self.btnLocalizacao.layer.shadowOffset = CGSizeMake(1.8, 1.8);
    self.btnLocalizacao.layer.shadowOpacity = 0.8;
    self.btnLocalizacao.layer.shadowRadius = 2.0;
    self.btnLocalizacao.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.btnLocalizacao.layer.borderWidth = 0.5;
    self.btnLocalizacao.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.btnLocalizacao.layer.cornerRadius = 2.5;
    self.btnLocalizacao.alpha = 0.9;
}

#pragma mark - Metodos IBAction

- (IBAction)procuraLocalizacao:(UIButton *)sender {
    CLLocationCoordinate2D coordinate = self.mapView.userLocation.coordinate;
    if (CLLocationCoordinate2DIsValid(coordinate) && coordinate.latitude && coordinate.longitude)
    {
        [self removeAviso];
        [self.mapView setCenterCoordinate:coordinate animated:YES];
    }
    else
    {
        [self adicionaAviso:QuedaConexaoTipoGPS];
    }
}

#pragma mark - Metodos Protocolo Ocorrencias

-(void)carregaOcorrencias
{
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotations:self.barController.arrAnnotations];
}

#pragma mark - Metodos MapView delegate

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    if (!self.updated)
    {
        self.updated = YES;
        [self removeAviso];
        [self.mapView setCenterCoordinate:self.mapView.userLocation.coordinate animated:YES];
    }
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[AnnotationView class]])
    {
        return (AnnotationView*)annotation;
    }
    
    return nil;
}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    if (self.zoomEnabled)
    {
        self.mapView.region = MKCoordinateRegionMake(((AnnotationView*)view).coordinate, MKCoordinateSpanMake(0.001, 0.001));
        self.zoomEnabled = NO;
    }
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    self.annotation = (AnnotationView*)view;
    [self performSegueWithIdentifier:@"sgDetalheOcorrenciaMapa" sender:nil];
}

@end
