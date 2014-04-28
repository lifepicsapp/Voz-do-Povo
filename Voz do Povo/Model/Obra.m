//
//  Obra.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 28/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "Obra.h"

@implementation Obra

+(Obra *)obraNome:(NSString*)nome descricao:(NSString*)descricao endereco:(NSString*)endereco dataInicio:(NSString*)dataInicio dataFim:(NSString*)dataFim imagem:(NSString*)nomeImagem status:(NSString*)status latitude:(float)latitude longitude:(float)longitude
{
    Obra* obra = [[Obra alloc] init];
    obra.imagem = [UIImage imageNamed:nomeImagem];
    obra.nome = nome;
    obra.descricao = descricao;
    obra.endereco = endereco;
    obra.dataInicio = dataInicio;
    obra.dataFim = dataFim;
    obra.status = status;
    obra.latitude = latitude;
    obra.longitude = longitude;
    
    return obra;
}

@end
