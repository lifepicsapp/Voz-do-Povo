//
//  Nota.h
//  Voz do Povo
//
//  Created by Gabriel Moraes on 27/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Nota : NSObject

@property (nonatomic, strong) NSString *disciplina;
@property (assign) NSInteger nota;
@property (assign) NSInteger faltas;

+(Nota *)notaDisciplina:(NSString*)disciplina nota:(NSInteger)valorNota faltas:(NSInteger)faltas;

@end
