//
//  BoletimViewController.h
//  Voz do Povo
//
//  Created by Gabriel Moraes on 27/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoletimViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) NSMutableArray* arrBoletins;
@property (assign) NSInteger indexAtual;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end
