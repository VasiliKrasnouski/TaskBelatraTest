//
//  DetailViewController.m
//  BelatraTest
//
//  Created by FanLee on 28/03/16.
//  Copyright © 2016 Vasili Krasnouski. All rights reserved.
//

#import "DetailViewController.h"
#import "RateInPeriodViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    _mainCurrencyName.text = [_mainCurrency valueForKey:@"Name"];
    _mainCurrencyShortName.text = [_mainCurrency valueForKey:@"CharCode"];
    _mainCurrencyRate.text = [_mainCurrency valueForKey:@"Rate"];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"puyshRatesInPeriod"]) {
       
        RateInPeriodViewController *rateInPeriodVC = segue.destinationViewController;
        rateInPeriodVC.mainCurrency = _mainCurrency;
        
    }
    
}



@end
