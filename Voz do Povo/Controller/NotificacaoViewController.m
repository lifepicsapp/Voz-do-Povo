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
    
    self.arrNotificacoes = [NSMutableArray arrayWithCapacity:7];
    [self.arrNotificacoes addObject:[Notificacao notificacaoTitulo:@"Alerta" descricao:@"Olá Gabriel Moraes, a prefeitura de São Caetano do Sul iniciará na próxima segunda, 10/02/2014, obras na Avenida Lemos Monteiro, evite o local até a data de 15/06/2014, transtorno hoje, benefícios amanhã!" data:@"08/02/2014"]];
    [self.arrNotificacoes addObject:[Notificacao notificacaoTitulo:@"Multirão da Catarata" descricao:@"Não perca neste final de semana o multirão da Catarata, exames preventivos, cirurgias e palestras sobre o assunto. Local: Hospital Municipal de Emergências Albert Sabin Rua Aurélia, 101, São Caetano do Sul, a partir das 08:00 hrs" data:@"08/02/2014"]];
    [self.arrNotificacoes addObject:[Notificacao notificacaoTitulo:@"Festa da Uva" descricao:@"Olá Gabriel Moraes, a prefeitura de São Caetano do Sul organizará para você o maior festival de uva do Estado de São Paulo, Av. Goiás, 25 a partir das 17:00 Hrs, não perca!" data:@"08/02/2014"]];
    [self.arrNotificacoes addObject:[Notificacao notificacaoTitulo:@"Bom Carnaval" descricao:@"Olá Gabriel Moraes, a prefeitura de São Caetano do Sul preparou para você e sua família diversas atrações carnavalecas, aproveite cada atração com o máximo de felicidades e lembre-se se beber não dirija!" data:@"08/02/2014"]];
    [self.arrNotificacoes addObject:[Notificacao notificacaoTitulo:@"Feliz 2014" descricao:@"Olá Gabriel Moraes, a prefeitura de São Caetano do Sul deseja a você, familiares e amigos um feliz ano de 2014, boas festas!" data:@"31/12/2013"]];
    [self.arrNotificacoes addObject:[Notificacao notificacaoTitulo:@"Feliz Natal" descricao:@"Olá Gabriel Moraes, a prefeitura de São Caetano do Sul deseja a você, familiares e amigos um feliz natal repleto de felicidades, boas festas!" data:@"24/12/2013"]];
    [self.arrNotificacoes addObject:[Notificacao notificacaoTitulo:@"Seja Bem Vindo" descricao:@"Olá Gabriel Moraes, seja bem vindo ao aplicativo da prefeitura de São Caetano do Sul, aqui você ficara bem informado sobre obras da cidade, poderá visualizar informações sobre a educação e registrar ocorrências acontecidas na cidade, tudo fácil e rápido." data:@"17/11/2013"]];
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
