//
//  OcorrenciaListaViewController.m
//  Voz do Povo
//
//  Created by Gabriel Moraes on 04/04/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "OcorrenciaListaViewController.h"
#import "AppUtil.h"
#import "OcorrenciaDetalheViewController.h"
#import "UIViewController+QuedaConexao.h"

@implementation OcorrenciaListaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"sgDetalheOcorrenciaLista"])
    {
        OcorrenciaDetalheViewController* controller = segue.destinationViewController;
        controller.annotation = self.annotation;
    }
}

#pragma mark - Metodos de Classe

-(OcorrenciaViewController *)barController
{
    return (OcorrenciaViewController*)self.tabBarController;
}

- (UIView *)panningCellWithFrame:(const CGRect)frame andColor:(UIColor*)color
{
    const CGFloat sizeBtn = 30;
    const NSInteger qtdBtns = 2;
    const CGFloat bordaBtn = (frame.size.width - sizeBtn * qtdBtns)/(qtdBtns*2);
    
    UIView* drawerView = [[UIView alloc] initWithFrame:frame];
    drawerView.backgroundColor = color;
    
    UIButton* btnMapa = [[UIButton alloc] initWithFrame:CGRectMake(bordaBtn, (frame.size.height-sizeBtn)/2, sizeBtn, sizeBtn)];
    [btnMapa setBackgroundImage:[UIImage imageNamed:@"map"] forState:UIControlStateNormal];
    [btnMapa addTarget:self action:@selector(ocorrenciaMapa) forControlEvents:UIControlEventTouchUpInside];
    
    [drawerView addSubview:btnMapa];
    
    UIButton* btnDetalhe = [UIButton buttonWithType:UIButtonTypeInfoDark];
    btnDetalhe.frame = CGRectMake(bordaBtn*3+sizeBtn, (frame.size.height-sizeBtn)/2, sizeBtn, sizeBtn);
    [btnDetalhe addTarget:self action:@selector(ocorrenciaDetalhe) forControlEvents:UIControlEventTouchUpInside];
    
    [drawerView addSubview:btnDetalhe];
    return drawerView;
}

- (void)reiniciaTabela
{
    self.searchBar.text = @"";
    self.arrFiltrado = nil;
    [self.tableView reloadData];
}

-(void)ocorrenciaMapa
{
    self.barController.annotation = self.annotation;
    self.tabBarController.selectedIndex = 0;
}

-(void)ocorrenciaDetalhe
{
    [self performSegueWithIdentifier:@"sgDetalheOcorrenciaLista" sender:nil];
}

#pragma mark - Metodos IBAction

- (IBAction)atualizaLocalizacao:(UIButton *)sender {
    self.updateLocation = YES;
    [self.locationManager startUpdatingLocation];
}

#pragma mark - Metodos Protocolo Ocorrencias

-(void)carregaOcorrencias
{
    [self reiniciaTabela];
}

#pragma mark - Metodos TableView datasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.arrFiltrado)
        return self.arrFiltrado.count;
    else
        return self.barController.arrAnnotations.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellOcorrencia";
    OcorrenciaView *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Ocorrencia *ocorrencia;
    
    if (self.arrFiltrado)
        ocorrencia = ((AnnotationView*)[self.arrFiltrado objectAtIndex:indexPath.item]).ocorrencia;
    else
        ocorrencia = ((AnnotationView*)[self.barController.arrAnnotations objectAtIndex:indexPath.item]).ocorrencia;
    
    cell.lblTitulo.text = ocorrencia.nome;
    cell.lblSubtitulo.text = ocorrencia.endereco;
    if (self.myLocation)
    {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:ocorrencia.latitude longitude:ocorrencia.longitude];
        CLLocationDistance distance = [self.myLocation distanceFromLocation:location];
        cell.lblDetalhe.text = [NSString stringWithFormat:@"Aproximado %.02f km", distance/1000];
        NSLog(@"%f", distance);
    }
    else
    {
        cell.lblDetalhe.text = @"";
    }
    
    cell.drawerView = [self panningCellWithFrame:cell.frame andColor:cell.backgroundColor];
    cell.delegate = self;
    
    return cell;
}

#pragma mark - Metodos TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.arrFiltrado)
        self.annotation = [self.arrFiltrado objectAtIndex:indexPath.item];
    else
        self.annotation = [self.barController.arrAnnotations objectAtIndex:indexPath.item];
    
    HHPanningTableViewCell* cell = (HHPanningTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.directionMask = HHPanningTableViewCellDirectionRight;
    [cell setDrawerRevealed:YES animated:YES];
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HHPanningTableViewCell* cell = (HHPanningTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    [cell setDrawerRevealed:NO animated:YES];
    cell.directionMask = 0;
}

#pragma mark - Metodos Panning delegate

-(void)panningTableViewCell:(HHPanningTableViewCell *)cell didTriggerWithDirection:(HHPanningTableViewCellDirection)direction
{
    cell.directionMask = 0;
}

#pragma mark - Metodos SearchBar Delegate

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [self reiniciaTabela];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.view endEditing:YES];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if ([searchText isEqualToString:@""])
    {
        self.arrFiltrado = nil;
    }
    else
    {
        NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"ocorrencia.nome contains[c] %@ OR ocorrencia.endereco contains[c] %@", searchText, searchText];
        self.arrFiltrado = [self.barController.arrAnnotations filteredArrayUsingPredicate:resultPredicate];
    }
    [self.tableView reloadData];
}

-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = NO;
    return YES;
}

-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = YES;
    return YES;
}

#pragma mark - Metodos Location

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    if (!self.myLocation || self.updateLocation)
    {
        [self removeAviso];
        self.updateLocation = NO;
        self.myLocation = [locations lastObject];
        [self.locationManager stopUpdatingLocation];
        [self.tableView reloadData];
    }
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [self adicionaAviso:QuedaConexaoTipoGPS];
    [self.locationManager stopUpdatingLocation];
    if (self.updateLocation)
    {
        self.updateLocation = NO;
        self.myLocation = nil;
        [self.tableView reloadData];
    }
}

@end
