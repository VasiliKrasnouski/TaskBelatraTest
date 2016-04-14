//
//  DetailViewController.h
//  BelatraTest
//
//  Created by FanLee on 28/03/16.
//  Copyright © 2016 Vasili Krasnouski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *mainCurrencyName;
@property (weak, nonatomic) IBOutlet UILabel *mainCurrencyShortName;
@property (weak, nonatomic) IBOutlet UILabel *mainCurrencyRate;
@property (strong, nonatomic) id mainCurrency;

@end
