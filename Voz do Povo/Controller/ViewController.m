//
//  ViewController.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 27/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "ViewController.h"
#import "Menu.h"
#import "MenuView.h"
#import "AppUtil.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [AppUtil removeTextoBotaoVoltar:self];
    
    self.arrMenu = [NSMutableArray arrayWithCapacity:4];
    [self.arrMenu addObject:[Menu menuTitulo:@"Mapa de Ocorrências" nomeIcone:@"icon_mapa_branco" acao:@"sgOcorrencias"]];
    [self.arrMenu addObject:[Menu menuTitulo:@"Canto do Estudante" nomeIcone:@"icon_school_branco" acao:@"sgEstudante"]];
    [self.arrMenu addObject:[Menu menuTitulo:@"Obras na Cidade" nomeIcone:@"icon_obras" acao:@"sgObras"]];
    [self.arrMenu addObject:[Menu menuTitulo:@"Central de Notificações" nomeIcone:@"icon_central_notificacao" acao:@"sgNotificacao"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection view datasource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arrMenu.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellMenu";
    MenuView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Menu *menu = [self.arrMenu objectAtIndex:indexPath.item];
    
    cell.imgIcone.image = menu.imagem;
    cell.lblTitulo.text = menu.titulo;
    
    return cell;
}

#pragma mark - Collection view delegate

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Menu* menu = [self.arrMenu objectAtIndex:indexPath.item];
    
    if (![menu.acao isEqualToString:@""])
    {
        [self performSegueWithIdentifier:menu.acao sender:nil];
    }
}

@end
