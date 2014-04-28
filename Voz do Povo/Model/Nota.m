//
//  Nota.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 27/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "Nota.h"

@implementation Nota

+(Nota *)notaDisciplina:(NSString*)disciplina nota:(NSInteger)valorNota faltas:(NSInteger)faltas
{
    Nota* nota = [[Nota alloc] init];
    nota.disciplina = disciplina;
    nota.nota = valorNota;
    nota.faltas = faltas;
    
    return nota;
}

@end
