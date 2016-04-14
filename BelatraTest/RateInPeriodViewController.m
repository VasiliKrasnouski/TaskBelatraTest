//
//  RateInPeriodViewController.m
//  BelatraTest
//
//  Created by FanLee on 28/03/16.
//  Copyright © 2016 Vasili Krasnouski. All rights reserved.
//

#import "RateInPeriodViewController.h"
#import "RatesTableViewCell.h"
#import "RateGraphViewController.h"

@interface RateInPeriodViewController ()
@property (nonatomic, strong) NSString *firstDate;
@property (nonatomic, strong) NSString *secondDate;

@end

@implementation RateInPeriodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _networkClass = [[Network alloc] init];
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:2016];
    [components setMonth:1];
    [components setDay:1];
    [_firstDatePicker setDate:[calendar dateFromComponents:components]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    _firstDate = [dateFormatter  stringFromDate:_firstDatePicker.date];
    [_secondDatePicker setDate:[NSDate date]];
    _secondDate = [dateFormatter  stringFromDate:_secondDatePicker.date];
    _drawRatesGraph.hidden = YES;

    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateTV:) name:@"DataInPeriodDownloadedNotification" object:nil];
       // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_ratesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   RatesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ratesCell"];
    
    if (nil==cell) {
        [tableView registerNib:[UINib nibWithNibName:@"RatesTableViewCell" bundle:nil] forCellReuseIdentifier:@"ratesCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"ratesCell"];
    }
    cell.date.text = [[_ratesArray objectAtIndex:indexPath.row] valueForKey:@"_Date"];
    cell.rate.text = [[_ratesArray objectAtIndex:indexPath.row] valueForKey:@"Rate"];
   
    return cell;
}
- (IBAction)pickerAction:(id)sender {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    
    if ([sender isEqual:_firstDatePicker]) {
        _firstDate = [dateFormatter  stringFromDate:_firstDatePicker.date];
        
    }else if ([sender isEqual:_secondDatePicker]){
        
        _secondDate = [dateFormatter  stringFromDate:_secondDatePicker.date];
    }

    
}
- (IBAction)getDataAction:(id)sender {
    
    NSString *currencyID = [_mainCurrency valueForKey:@"_Id"];
    int currencyId = [currencyID intValue];
    
    [_networkClass downloadDataForCurrencyInPeriod:currencyId fromDate:_firstDate toDate:_secondDate];
}
-(void)updateTV:(NSNotification*)notification{
    
    _ratesArray = [[notification userInfo]valueForKey:@"Record"];
    
    [_ratesTV reloadData];
    _drawRatesGraph.hidden = NO;
    
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"pushRateGraph"]) {
        
        
        RateGraphViewController *rateGraphVC = segue.destinationViewController;
        rateGraphVC.ratesArray = [NSMutableArray arrayWithArray:_ratesArray];
        
    }
    
}









@end
