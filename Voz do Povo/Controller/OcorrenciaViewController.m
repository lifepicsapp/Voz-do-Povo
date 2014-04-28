//
//  OcorrenciaViewController.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 02/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "OcorrenciaViewController.h"
#import "AppUtil.h"
#import "AnnotationView.h"

@implementation OcorrenciaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [AppUtil removeTextoBotaoVoltar:self];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    NSMutableArray* arrOcorrencias = [NSMutableArray arrayWithCapacity:3];
    [arrOcorrencias addObject:[Ocorrencia ocorrenciaNome:@"Vias públicas" descricao:@"Buraco aberto levando perigo a carros e pedestres" endereco:@"Rua Picuí, Olímpico, São Caetano do Sul" data:@"20/02/2014" imagem:@"buraco" latitude:-23.625398 longitude:-46.560230]];
    [arrOcorrencias addObject:[Ocorrencia ocorrenciaNome:@"Água e esgoto" descricao:@"Bueiro entupido soltando mal cheiro" endereco:@"Rua Idalino Moreti, Olímpico, São Caetano do Sul" data:@"18/02/2014" imagem:@"bueiro" latitude:-23.624140 longitude:-46.565723]];
    [arrOcorrencias addObject:[Ocorrencia ocorrenciaNome:@"Árvores e matos" descricao:@"Árvore quebrada por moradores" endereco:@"Rua Gonzaga, Osvaldo Cruz, São Caetano do Sul" data:@"15/02/2014" imagem:@"arvore" latitude:-23.631768 longitude:-46.560574]];
    
    self.arrAnnotations = [NSMutableArray arrayWithCapacity:arrOcorrencias.count];
    for (Ocorrencia* ocorrencia in arrOcorrencias)
    {
        AnnotationView* annotation = [[AnnotationView alloc] init];
        annotation.ocorrencia = ocorrencia;
        annotation.title = ocorrencia.nome;
        annotation.subtitle = ocorrencia.descricao;
        annotation.image = [UIImage imageNamed:@"pin_local"];
        annotation.canShowCallout = YES;
        annotation.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoDark];
        [self.arrAnnotations addObject:annotation];
    }
    for (id<OcorrenciaProtocol> controller in self.viewControllers)
    {
        if ([controller respondsToSelector:@selector(carregaOcorrencias)])
            [controller carregaOcorrencias];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Tab Bar delegate

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {}

@end
