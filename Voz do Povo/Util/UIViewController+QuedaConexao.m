//
//  UIViewController+QuedaConexao.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 24/03/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "UIViewController+QuedaConexao.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

@implementation UIViewController (QuedaConexao)

static char const * const ObjectTagKey = "BarraAviso";

@dynamic barraAviso;

- (id)barraAviso {
    return objc_getAssociatedObject(self, ObjectTagKey);
}

- (void)setBarraAviso:(id)newObjectTag {
    objc_setAssociatedObject(self, ObjectTagKey, newObjectTag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)adicionaAviso:(QuedaConexaoTipo)tipoAviso
{
    if (!self.barraAviso)
    {
        self.barraAviso = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 44)];
        self.barraAviso.alpha = 0.0;
        [self.view addSubview:self.barraAviso];
        
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
        [self.barraAviso addGestureRecognizer:tap];
        
        UIImageView* imagem = [[UIImageView alloc] initWithFrame:CGRectMake(10, (self.barraAviso.frame.size.height - 26)/2, 26, 26)];
        
        UILabel* mensagem = [[UILabel alloc] initWithFrame:CGRectMake(imagem.frame.size.width + 20, 0, self.view.frame.size.width - (imagem.frame.size.width + 50), self.barraAviso.frame.size.height)];
        mensagem.adjustsFontSizeToFitWidth = YES;
        mensagem.minimumScaleFactor = 9.0/[UIFont labelFontSize];
        mensagem.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
        
        UILabel* fechar = [[UILabel alloc] initWithFrame:CGRectMake(imagem.frame.size.width + mensagem.frame.size.width + 30, 0, 10, self.barraAviso.frame.size.height - 2)];
        fechar.text = @"x";
        fechar.adjustsFontSizeToFitWidth = YES;
        mensagem.minimumScaleFactor = 9.0/[UIFont labelFontSize];
        fechar.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
        
        NSString* aviso;
        
        if (tipoAviso == QuedaConexaoTipoInternet)
        {
            aviso = @"Verifique sua conexão com a internet";
            self.barraAviso.backgroundColor = [UIColor redColor];
            imagem.image = [UIImage imageNamed:@"alert"];
            mensagem.textColor = [UIColor whiteColor];
            fechar.textColor = [UIColor whiteColor];
        }
        else if (tipoAviso == QuedaConexaoTipoGPS)
        {
            aviso = @"Verifique se a sua localização está ativa";
            self.barraAviso.backgroundColor = [UIColor yellowColor];
            imagem.image = [UIImage imageNamed:@"alert_redondo"];
            mensagem.textColor = [UIColor blackColor];
            fechar.textColor = [UIColor blackColor];
        }
        
        mensagem.text = aviso;
        
        [self.barraAviso addSubview:imagem];
        [self.barraAviso addSubview:mensagem];
        [self.barraAviso addSubview:fechar];
        
        [UIView animateWithDuration:0.5 animations:^{
            self.barraAviso.alpha = 1.0;
        }];
    }
}

-(void)removeAviso
{
    if (self.barraAviso)
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.barraAviso.alpha = 0.0;
        } completion:^(BOOL finished) {
            [self.barraAviso removeFromSuperview];
            self.barraAviso = nil;
        }];
    }
}

-(void)onTap:(UITapGestureRecognizer*)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateEnded)
        [self removeAviso];
}

@end
