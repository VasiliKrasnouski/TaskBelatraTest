//
//  Network.h
//  BelatraTest
//
//  Created by FanLee on 25/03/16.
//  Copyright © 2016 Vasili Krasnouski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface Network : NSObject

extern NSString *const DataDownloadedNotification;

@property(nonatomic, strong) NSDictionary *responseData;
-(void)downloadData;
-(void)downloadDataForCurrencyInPeriod:(int)cureID fromDate:(NSString*)fromDate toDate:(NSString*)toDate;
@end
