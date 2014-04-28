//
//  NotaView.h
//  Voz do Povo
//
//  Created by Gabriel Moraes on 27/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotaView : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblDisciplina;
@property (weak, nonatomic) IBOutlet UILabel *lblNota;
@property (weak, nonatomic) IBOutlet UILabel *lblFaltas;

@end
