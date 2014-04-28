//
//  AnnotationView.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 31/03/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "AnnotationView.h"

@implementation AnnotationView

-(void)setOcorrencia:(Ocorrencia *)ocorrencia {
    _ocorrencia = ocorrencia;
    
    CLLocationCoordinate2D coordinate = {ocorrencia.latitude, ocorrencia.longitude};
    self.coordinate = coordinate;
}

-(void)setObra:(Obra *)obra {
    _obra = obra;
    
    CLLocationCoordinate2D coordinate = {obra.latitude, obra.longitude};
    self.coordinate = coordinate;
    self.leftCalloutAccessoryView = [[UIImageView alloc] initWithImage:obra.imagem];
}

@end
