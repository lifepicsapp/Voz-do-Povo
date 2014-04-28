//
//  CalendarioViewController.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 27/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "CalendarioViewController.h"
#import "Notificacao.h"
#import "CalendarioView.h"

@interface CalendarioViewController ()

@end

@implementation CalendarioViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.arrNotificacoes = [NSMutableArray arrayWithCapacity:6];
    [self.arrNotificacoes addObject:[Notificacao notificacaoTitulo:@"Matemática" descricao:@"Prova Semestral" data:@"27/02/2014"]];
    [self.arrNotificacoes addObject:[Notificacao notificacaoTitulo:@"Matemática" descricao:@"Atividade de Sala" data:@"24/02/2014"]];
    [self.arrNotificacoes addObject:[Notificacao notificacaoTitulo:@"Português" descricao:@"Atividade de Casa" data:@"24/02/2014"]];
    [self.arrNotificacoes addObject:[Notificacao notificacaoTitulo:@"História" descricao:@"Atividade de Sala" data:@"20/02/2014"]];
    [self.arrNotificacoes addObject:[Notificacao notificacaoTitulo:@"Geografia" descricao:@"Prova Semestral" data:@"18/02/2014"]];
    [self.arrNotificacoes addObject:[Notificacao notificacaoTitulo:@"Inglês" descricao:@"Prova Semestral" data:@"15/02/2014"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrNotificacoes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellCalendario";
    CalendarioView *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Notificacao *notificacao = [self.arrNotificacoes objectAtIndex:indexPath.item];
    
    cell.lblDisciplina.text = notificacao.titulo;
    cell.lblDescricao.text = notificacao.descricao;
    cell.lblData.text = notificacao.data;
    
    return cell;
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
