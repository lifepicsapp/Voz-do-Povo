//
//  BoletimViewController.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 27/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "BoletimViewController.h"
#import "BoletimView.h"
#import "Nota.h"

@interface BoletimViewController ()

@end

@implementation BoletimViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.arrBoletins = [NSMutableArray arrayWithCapacity:4];
    [self.arrBoletins addObject:
     [Boletim boletimNotas:@[[Nota notaDisciplina:@"Matemática" nota:10 faltas:5],
                             [Nota notaDisciplina:@"Português" nota:9 faltas:8],
                             [Nota notaDisciplina:@"Química" nota:6 faltas:3],
                             [Nota notaDisciplina:@"História" nota:8 faltas:2],
                             [Nota notaDisciplina:@"Geografia" nota:8 faltas:1],
                             [Nota notaDisciplina:@"Inglês" nota:9 faltas:7],
                             [Nota notaDisciplina:@"Biologia" nota:5 faltas:5],
                             [Nota notaDisciplina:@"Física" nota:7 faltas:6],
                             ] semestre:1]];
    [self.arrBoletins addObject:
     [Boletim boletimNotas:@[[Nota notaDisciplina:@"Matemática" nota:10 faltas:5],
                             [Nota notaDisciplina:@"Português" nota:9 faltas:8],
                             [Nota notaDisciplina:@"Química" nota:6 faltas:3],
                             [Nota notaDisciplina:@"História" nota:8 faltas:2],
                             [Nota notaDisciplina:@"Geografia" nota:8 faltas:1],
                             [Nota notaDisciplina:@"Inglês" nota:9 faltas:7],
                             [Nota notaDisciplina:@"Biologia" nota:5 faltas:5],
                             [Nota notaDisciplina:@"Física" nota:7 faltas:6],
                             ] semestre:2]];
    [self.arrBoletins addObject:
     [Boletim boletimNotas:@[[Nota notaDisciplina:@"Matemática" nota:10 faltas:5],
                             [Nota notaDisciplina:@"Português" nota:9 faltas:8],
                             [Nota notaDisciplina:@"Química" nota:6 faltas:3],
                             [Nota notaDisciplina:@"História" nota:8 faltas:2],
                             [Nota notaDisciplina:@"Geografia" nota:8 faltas:1],
                             [Nota notaDisciplina:@"Inglês" nota:9 faltas:7],
                             [Nota notaDisciplina:@"Biologia" nota:5 faltas:5],
                             [Nota notaDisciplina:@"Física" nota:7 faltas:6],
                             ] semestre:3]];
    [self.arrBoletins addObject:
     [Boletim boletimNotas:@[[Nota notaDisciplina:@"Matemática" nota:10 faltas:5],
                             [Nota notaDisciplina:@"Português" nota:9 faltas:8],
                             [Nota notaDisciplina:@"Química" nota:6 faltas:3],
                             [Nota notaDisciplina:@"História" nota:8 faltas:2],
                             [Nota notaDisciplina:@"Geografia" nota:8 faltas:1],
                             [Nota notaDisciplina:@"Inglês" nota:9 faltas:7],
                             [Nota notaDisciplina:@"Biologia" nota:5 faltas:5],
                             [Nota notaDisciplina:@"Física" nota:7 faltas:6],
                             ] semestre:4]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection view datasource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arrBoletins.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellBoletim";
    BoletimView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.boletim = [self.arrBoletins objectAtIndex:indexPath.item];
    
    return cell;
}

#pragma mark - Collection view delegate

-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath* index = [self.collectionView indexPathsForVisibleItems][0];
    self.pageControl.currentPage = index.item;
}

@end
