//
//  AllRatesTableViewController.m
//  BelatraTest
//
//  Created by FanLee on 25/03/16.
//  Copyright © 2016 Vasili Krasnouski. All rights reserved.
//

#import "AllRatesTableViewController.h"
#import "MyCustomCell.h"
#import "DetailViewController.h"

@interface AllRatesTableViewController ()

@end

@implementation AllRatesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    id NetworkObj = [[Network alloc] init];
    [NetworkObj downloadData];
    self.navigationController.navigationBar.hidden = YES;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateView:) name:@"DataDownloadedNotification" object:nil];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}
-(void)updateView:(NSNotification*)notification{
    _currencysArray = [[notification userInfo]valueForKey:@"Currency"];
   
    [self.tableView reloadData];
    
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_currencysArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customCell"];
    
    if (nil==cell) {
        [tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil] forCellReuseIdentifier:@"customCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"customCell"];
    }
    NSMutableDictionary *currencyInfo = [_currencysArray objectAtIndex:indexPath.row];
    cell.currencyName.text = [currencyInfo valueForKey:@"CharCode"];
    cell.currencyRate.text = [currencyInfo valueForKey:@"Rate"];
    cell.currencyFullName.text = [currencyInfo valueForKey:@"Name"];
    

    
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"pushDetailView" sender:self];

    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"pushDetailView"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        id objectAtRow = [_currencysArray objectAtIndex: indexPath.row];
        DetailViewController *detailVC = segue.destinationViewController;
        detailVC.mainCurrency = objectAtRow;
       
    }    
    
}


@end
