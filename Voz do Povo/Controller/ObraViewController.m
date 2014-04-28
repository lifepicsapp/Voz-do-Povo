//
//  ObraViewController.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 28/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "ObraViewController.h"
#import "UIViewController+QuedaConexao.h"
#import "ObraDetalheViewController.h"
#import "AppUtil.h"

@interface ObraViewController ()

@end

@implementation ObraViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [AppUtil removeTextoBotaoVoltar:self];
    
    [self personalizaBotaoLocalizacao];
    
    self.mapView.showsUserLocation = YES;
    
    NSMutableArray* arrObras = [NSMutableArray arrayWithCapacity:1];
    [arrObras addObject:[Obra obraNome:@"Hospital" descricao:@"Novo Hospital de São Caetano" endereco:@"Rua São Caetano 1024" dataInicio:@"02/2014" dataFim:@"08/2015" imagem:@"hospital" status:@"Em andamento" latitude:-23.42166 longitude:-46.4364118]];
    
    self.arrAnnotations = [NSMutableArray arrayWithCapacity:arrObras.count];
    for (Obra* obra in arrObras)
    {
        AnnotationView* annotation = [[AnnotationView alloc] init];
        annotation.obra = obra;
        annotation.title = obra.nome;
        annotation.image = [UIImage imageNamed:@"pin_local"];
        annotation.canShowCallout = YES;
        annotation.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoDark];
        [self.arrAnnotations addObject:annotation];
    }
    [self.mapView addAnnotations:self.arrAnnotations];
    
    MKCoordinateRegion region;
    region.center = CLLocationCoordinate2DMake(-23.553602, -46.63221);
    MKCoordinateSpan span;
    span.latitudeDelta  = 0.05;
    span.longitudeDelta = 0.05;
    region.span = span;
    [self.mapView setRegion:region animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"sgDetalheObra"])
    {
        ObraDetalheViewController* controller = segue.destinationViewController;
        controller.annotation = self.annotation;
    }
}

#pragma mark - Metodos de Classe

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
    self.mapView.region = MKCoordinateRegionMake(((AnnotationView*)view).coordinate, MKCoordinateSpanMake(0.001, 0.001));
}


-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    self.annotation = (AnnotationView*)view;
    [self performSegueWithIdentifier:@"sgDetalheObra" sender:nil];
}

@end
