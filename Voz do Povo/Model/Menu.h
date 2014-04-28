//
//  Menu.h
//  Voz do Povo
//
//  Created by Gabriel Moraes on 27/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Menu : NSObject

@property (nonatomic, strong) NSString *titulo;
@property (nonatomic, strong) UIImage *imagem;
@property (nonatomic, strong) NSString *acao;

+(Menu *)menuTitulo:(NSString*)titulo nomeIcone:(NSString*)nomeIcone acao:(NSString*)acao;

@end
