//
//  Obra.h
//  Voz do Povo
//
//  Created by Gabriel Moraes on 28/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Obra : NSObject

@property (nonatomic, strong) NSString* nome;
@property (nonatomic, strong) NSString* descricao;
@property (nonatomic, strong) NSString* endereco;
@property (nonatomic, strong) NSString* dataInicio;
@property (nonatomic, strong) NSString* dataFim;
@property (nonatomic, strong) NSString* status;
@property (nonatomic, strong) UIImage* imagem;
@property (assign) float latitude;
@property (assign) float longitude;

+(Obra *)obraNome:(NSString*)nome descricao:(NSString*)descricao endereco:(NSString*)endereco dataInicio:(NSString*)dataInicio dataFim:(NSString*)dataFim imagem:(NSString*)nomeImagem status:(NSString*)status latitude:(float)latitude longitude:(float)longitude;

@end
