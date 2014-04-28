//
//  Menu.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 27/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "Menu.h"

@implementation Menu

+(Menu *)menuTitulo:(NSString*)titulo nomeIcone:(NSString*)nomeIcone acao:(NSString*)acao {
    Menu *menu = [[Menu alloc] init];
    menu.titulo = titulo;
    menu.imagem = [UIImage imageNamed:nomeIcone];
    menu.acao = acao;
    
    return menu;
}

@end
