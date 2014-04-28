//
//  UIViewController+QuedaConexao.h
//  Voz do Povo
//
//  Created by Gabriel Moraes on 24/03/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    QuedaConexaoTipoGPS,
    QuedaConexaoTipoInternet
} QuedaConexaoTipo;

@interface UIViewController (QuedaConexao)

@property (nonatomic, retain) UIView* barraAviso;

-(void)adicionaAviso:(QuedaConexaoTipo)tipoAviso;
-(void)removeAviso;

@end