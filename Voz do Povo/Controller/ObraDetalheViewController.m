//
//  ObraDetalheViewController.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 28/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "ObraDetalheViewController.h"
#import "AppUtil.h"
#import "CustomAnnotation.h"

@interface ObraDetalheViewController ()

@end

@implementation ObraDetalheViewController

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
    
    Obra* obra = self.annotation.obra;
    self.imgView.image = obra.imagem;
    self.lblNome.text = obra.nome;
    self.lblData.text = [NSString stringWithFormat:@"Início: %@", obra.dataInicio];
    self.lblTermino.text = [NSString stringWithFormat:@"Término previsto: %@", obra.dataFim];
    self.lblStatus.text = [NSString stringWithFormat:@"Status: %@", obra.status];
    self.lblEndereco.text = obra.endereco;
    self.txtDescricao.text = obra.descricao;
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
