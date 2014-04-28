//
//  OcorrenciaView.h
//  Voz do Povo
//
//  Created by Gabriel Moraes on 04/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHPanningTableViewCell.h"

@interface OcorrenciaView : HHPanningTableViewCell

@property(nonatomic, weak) IBOutlet UILabel *lblTitulo;
@property(nonatomic, weak) IBOutlet UILabel *lblSubtitulo;
@property(nonatomic, weak) IBOutlet UILabel *lblDetalhe;

@end
