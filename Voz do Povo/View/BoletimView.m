//
//  BoletimView.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 27/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "BoletimView.h"
#import "NotaView.h"
#import "Nota.h"

@implementation BoletimView

-(void)setBoletim:(Boletim *)boletim
{
    _boletim = boletim;
    
    self.lblSemestre.text = [NSString stringWithFormat:@"%dº Semestre", _boletim.semestre];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.boletim.notas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellNota";
    NotaView *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Nota *nota = [self.boletim.notas objectAtIndex:indexPath.item];
    cell.lblDisciplina.text = nota.disciplina;
    cell.lblNota.text = [NSString stringWithFormat:@"%d", nota.nota];
    cell.lblFaltas.text = [NSString stringWithFormat:@"%d", nota.faltas];
    
    return cell;
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
