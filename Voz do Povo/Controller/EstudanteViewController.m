//
//  EstudanteViewController.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 27/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "EstudanteViewController.h"
#import "Menu.h"
#import "MenuView.h"
#import "AppUtil.h"

@interface EstudanteViewController ()

@end

@implementation EstudanteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [AppUtil removeTextoBotaoVoltar:self];
    
    self.arrMenu = [NSMutableArray arrayWithCapacity:2];
    [self.arrMenu addObject:[Menu menuTitulo:@"Boletim" nomeIcone:@"icon_boletim" acao:@"sgBoletim"]];
    [self.arrMenu addObject:[Menu menuTitulo:@"Calendário" nomeIcone:@"icon_calendar" acao:@"sgCalendario"]];
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
    static NSString *CellIdentifier = @"CellMenuEstudante";
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
