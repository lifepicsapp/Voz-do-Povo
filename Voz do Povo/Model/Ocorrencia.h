//
//  Ocorrencia.h
//  Voz do Povo
//
//  Created by Gabriel Moraes on 28/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ocorrencia : NSObject

@property (nonatomic, strong) NSString* nome;
@property (nonatomic, strong) NSString* descricao;
@property (nonatomic, strong) NSString* endereco;
@property (nonatomic, strong) NSString* data;
@property (nonatomic, strong) UIImage* imagem;
@property (assign) float latitude;
@property (assign) float longitude;

+(Ocorrencia *)ocorrenciaNome:(NSString*)nome descricao:(NSString*)descricao endereco:(NSString*)endereco  data:(NSString*)data imagem:(NSString*)nomeImagem latitude:(float)latitude longitude:(float)longitude;

@end
