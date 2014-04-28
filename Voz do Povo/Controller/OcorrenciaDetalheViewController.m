//
//  OcorrenciaDetalheViewController.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 07/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "OcorrenciaDetalheViewController.h"
#import "AppUtil.h"
#import "CustomAnnotation.h"

@implementation OcorrenciaDetalheViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CustomAnnotation* annotation = [[CustomAnnotation alloc] init];
    annotation.title = self.annotation.title;
    annotation.coordinate = self.annotation.coordinate;
    
    self.mapView.region = MKCoordinateRegionMake(self.annotation.coordinate, MKCoordinateSpanMake(0.01, 0.01));
    [self.mapView addAnnotation:annotation];
    [self.mapView selectAnnotation:annotation animated:YES];
    
    Ocorrencia* ocorrencia = self.annotation.ocorrencia;
    self.imgView.image = ocorrencia.imagem;
    self.lblNome.text = ocorrencia.nome;
    self.lblData.text = ocorrencia.data;
    self.lblEndereco.text = ocorrencia.endereco;
    self.txtDescricao.text = ocorrencia.descricao;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Metodos IBAction

- (IBAction)tracaRota:(UIButton *)sender {
    [AppUtil rotaParaDestino:CLLocationCoordinate2DMake(self.annotation.ocorrencia.latitude, self.annotation.ocorrencia.longitude)];
}

#pragma mark - Metodos MapView delegate

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[CustomAnnotation class]])
    {
        static NSString * const identifier = @"CustomAnnotation";
        
        MKAnnotationView* annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (annotationView)
            annotationView.annotation = annotation;
        else
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        
        annotationView.image = [UIImage imageNamed:@"pin_local"];
        annotationView.canShowCallout = YES;
        
        return annotationView;
    }
    return nil;
}

@end
