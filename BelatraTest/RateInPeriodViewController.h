//
//  RateInPeriodViewController.h
//  BelatraTest
//
//  Created by FanLee on 28/03/16.
//  Copyright © 2016 Vasili Krasnouski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Network.h"

@interface RateInPeriodViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *ratesTV;
@property (weak, nonatomic) IBOutlet UIDatePicker *firstDatePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *secondDatePicker;
@property (strong ,nonatomic) Network *networkClass;
@property (strong, nonatomic) id mainCurrency;
@property (strong, nonatomic) NSArray *ratesArray;
@property (weak, nonatomic) IBOutlet UIButton *drawRatesGraph;

@end
