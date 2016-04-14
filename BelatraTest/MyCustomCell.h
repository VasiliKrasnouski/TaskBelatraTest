//
//  MyCustomCell.h
//  BelatraTest
//
//  Created by FanLee on 28/03/16.
//  Copyright © 2016 Vasili Krasnouski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *currencyName;
@property (weak, nonatomic) IBOutlet UILabel *currencyRate;
@property (weak, nonatomic) IBOutlet UILabel *currencyFullName;

@end
