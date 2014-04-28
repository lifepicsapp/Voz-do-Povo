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
    self.updated = YES;
    
    NSMutableArray* arrObras = [NSMutableArray arrayWithCapacity:3];
    [arrObras addObject:[Obra obraNome:@"Hospital" descricao:@"Extensão do complexo B do Hospital Infantil Marcia Braido" dataInicio:@"13/01/2014" dataFim:@"08/02/2015" imagem:@"hospital" status:@"Andamento" latitude:-23.622459 longitude:-46.564071]];
    [arrObras addObject:[Obra obraNome:@"Operação Urbana" descricao:@"Revitalização de esgotos e águas pluviais" dataInicio:@"03/12/2013" dataFim:@"07/05/2014" imagem:@"esgoto" status:@"Andamento" latitude:-23.626351 longitude:-46.567976]];
    [arrObras addObject:[Obra obraNome:@"Operação Urbana" descricao:@"Recapeamento de asfalto" dataInicio:@"07/02/2014" dataFim:@"08/02/2014" imagem:@"recapeamento" status:@"Andamento" latitude:-23.620218 longitude:-46.564758]];
    
    self.arrAnnotations = [NSMutableArray arrayWithCapacity:arrObras.count];
    for (Obra* obra in arrObras)
    {
        AnnotationView* annotation = [[AnnotationView alloc] init];
        annotation.obra = obra;
        annotation.title = obra.nome;
        annotation.subtitle = obra.descricao;
        annotation.image = [UIImage imageNamed:@"pin_local"];
        annotation.canShowCallout = YES;
        annotation.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoDark];
        [self.arrAnnotations addObject:annotation];
    }
    [self.mapView addAnnotations:self.arrAnnotations];
    
    MKCoordinateRegion region;
    region.center = CLLocationCoordinate2DMake(-23.624002, -46.565666);
    MKCoordinateSpan span;
    span.latitudeDelta  = 0.009;
    span.longitudeDelta = 0.009;
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
