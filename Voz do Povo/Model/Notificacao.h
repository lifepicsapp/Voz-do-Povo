//
//  Notificacao.h
//  Voz do Povo
//
//  Created by Gabriel Moraes on 27/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notificacao : NSObject

@property (nonatomic, strong) NSString *titulo;
@property (nonatomic, strong) NSString *descricao;
@property (nonatomic, strong) NSString *data;

+(Notificacao *)notificacaoTitulo:(NSString*)titulo descricao:(NSString*)descricao data:(NSString*)data;

@end
