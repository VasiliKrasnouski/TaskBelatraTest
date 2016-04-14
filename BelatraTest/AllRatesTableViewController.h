//
//  AllRatesTableViewController.h
//  BelatraTest
//
//  Created by FanLee on 25/03/16.
//  Copyright © 2016 Vasili Krasnouski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Network.h"
@interface AllRatesTableViewController : UITableViewController

@property (nonatomic, strong) Network *network;
@property (nonatomic, strong) NSMutableArray *currencysArray;


@end
