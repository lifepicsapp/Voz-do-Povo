//
//  OcorrenciaViewController.h
//  Voz do Povo
//
//  Created by Gabriel Moraes on 02/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnnotationView.h"

@interface OcorrenciaViewController : UITabBarController

@property (nonatomic,strong) NSMutableArray *arrAnnotations;
@property (nonatomic,strong) AnnotationView* annotation;

@end

@protocol OcorrenciaProtocol <NSObject>

-(void)carregaOcorrencias;

@end