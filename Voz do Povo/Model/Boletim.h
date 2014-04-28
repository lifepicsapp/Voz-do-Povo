//
//  Boletim.h
//  Voz do Povo
//
//  Created by Gabriel Moraes on 27/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Boletim : NSObject

@property (assign) NSInteger semestre;
@property (nonatomic, strong) NSArray *notas;

+(Boletim *)boletimNotas:(NSArray*)notas semestre:(NSInteger)semestre;

@end
