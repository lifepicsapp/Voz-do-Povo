//
//  Notificacao.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 27/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "Notificacao.h"

@implementation Notificacao

+(Notificacao *)notificacaoTitulo:(NSString*)titulo descricao:(NSString*)descricao data:(NSString*)data
{
    Notificacao *notificacao = [[Notificacao alloc] init];
    notificacao.titulo = titulo;
    notificacao.descricao = descricao;
    notificacao.data = data;
    
    return notificacao;
}

@end
