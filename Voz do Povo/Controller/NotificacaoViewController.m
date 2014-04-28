//
//  NotificacaoViewController.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 27/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "NotificacaoViewController.h"
#import "Notificacao.h"

@interface NotificacaoViewController ()

@end

@implementation NotificacaoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.arrNotificacoes = [NSMutableArray arrayWithCapacity:10];
    [self.arrNotificacoes addObject:[Notificacao notificacaoTitulo:@"Alerta" descricao:@"Olá Gabriel Moraes, a Prefeitura de São Caetano do Sul" data:@"08/02/2014"]];
    [self.arrNotificacoes addObject:[Notificacao notificacaoTitulo:@"Multirão da Catarata" descricao:@"Olá Gabriel Moraes, a Prefeitura de São Caetano do Sul" data:@"08/02/2014"]];
    [self.arrNotificacoes addObject:[Notificacao notificacaoTitulo:@"Festa da Uva" descricao:@"Olá Gabriel Moraes, a Prefeitura de São Caetano do Sul" data:@"08/02/2014"]];
    [self.arrNotificacoes addObject:[Notificacao notificacaoTitulo:@"Bom Carnaval" descricao:@"Olá Gabriel Moraes, a Prefeitura de São Caetano do Sul" data:@"08/02/2014"]];
    [self.arrNotificacoes addObject:[Notificacao notificacaoTitulo:@"Feliz 2014" descricao:@"Olá Gabriel Moraes, a Prefeitura de São Caetano do Sul" data:@"08/02/2014"]];
    [self.arrNotificacoes addObject:[Notificacao notificacaoTitulo:@"Feliz Natal" descricao:@"Olá Gabriel Moraes, a Prefeitura de São Caetano do Sul" data:@"08/02/2014"]];
    [self.arrNotificacoes addObject:[Notificacao notificacaoTitulo:@"Seja Bem Vindo" descricao:@"Olá Gabriel Moraes, a Prefeitura de São Caetano do Sul" data:@"08/02/2014"]];
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
    static NSString *CellIdentifier = @"CellNotificacao";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Notificacao *notificacao = [self.arrNotificacoes objectAtIndex:indexPath.item];
    
    cell.textLabel.text = notificacao.titulo;
    cell.detailTextLabel.text = notificacao.descricao;
    
    return cell;
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Notificacao *notificacao = [self.arrNotificacoes objectAtIndex:indexPath.item];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:notificacao.titulo message:notificacao.descricao delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

@end
