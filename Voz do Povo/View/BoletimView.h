//
//  BoletimView.h
//  Voz do Povo
//
//  Created by Gabriel Moraes on 27/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Boletim.h"

@interface BoletimView : UICollectionViewCell <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) Boletim *boletim;

@property (weak, nonatomic) IBOutlet UILabel *lblSemestre;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
