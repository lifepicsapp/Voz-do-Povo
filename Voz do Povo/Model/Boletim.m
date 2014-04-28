//
//  Boletim.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 27/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "Boletim.h"

@implementation Boletim

+(Boletim *)boletimNotas:(NSArray*)notas semestre:(NSInteger)semestre
{
    Boletim* boletim = [[Boletim alloc] init];
    boletim.semestre = semestre;
    boletim.notas = notas;
    return boletim;
}

@end
