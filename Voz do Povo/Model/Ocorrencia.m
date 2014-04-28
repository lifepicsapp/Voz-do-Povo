//
//  Ocorrencia.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 28/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "Ocorrencia.h"

@implementation Ocorrencia

+(Ocorrencia *)ocorrenciaNome:(NSString*)nome descricao:(NSString*)descricao endereco:(NSString*)endereco  data:(NSString*)data imagem:(NSString*)nomeImagem latitude:(float)latitude longitude:(float)longitude
{
    Ocorrencia* ocorrencia = [[Ocorrencia alloc] init];
    ocorrencia.imagem = [UIImage imageNamed:nomeImagem];
    ocorrencia.nome = nome;
    ocorrencia.descricao = descricao;
    ocorrencia.endereco = endereco;
    ocorrencia.data = data;
    ocorrencia.latitude = latitude;
    ocorrencia.longitude = longitude;
    
    return ocorrencia;
}

@end
