//
//  Network.m
//  BelatraTest
//
//  Created by FanLee on 25/03/16.
//  Copyright © 2016 Vasili Krasnouski. All rights reserved.
//

#import "Network.h"
#import "XMLDictionary.h"


@implementation Network

-(void)downloadData{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    NSDate *curDate = [NSDate date];
    NSString *foolDate = [dateFormatter stringFromDate:curDate];
  

    NSString *const DataDownloadedNotification = @"DataDownloadedNotification";
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.nbrb.by/Services/XmlExRates.aspx?ondate=%@", foolDate]];
   
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    dispatch_async(dispatch_get_main_queue(),^{
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.responseSerializer = [AFXMLParserResponseSerializer serializer];
        operation.responseSerializer.stringEncoding = NSWindowsCP1251StringEncoding;
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSDictionary *rootDictionary = [NSDictionary dictionaryWithXMLParser:(NSXMLParser*)responseObject];
            
            [[NSNotificationCenter defaultCenter] postNotificationName: DataDownloadedNotification object:nil userInfo:rootDictionary];
        } failure:nil];
        
        [operation start];
    });
    
}
-(void)downloadDataForCurrencyInPeriod:(int)cureID fromDate:(NSString*)fromDate toDate:(NSString*)toDate{
 
    NSString *const DataInPeriodDownloadedNotification = @"DataInPeriodDownloadedNotification";
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.nbrb.by/Services/XmlExRatesDyn.aspx?curId=%d&fromDate=%@&toDate=%@",cureID,fromDate,toDate ]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    dispatch_async(dispatch_get_main_queue(),^{
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.responseSerializer = [AFXMLParserResponseSerializer serializer];
        operation.responseSerializer.stringEncoding = NSWindowsCP1251StringEncoding;
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSDictionary *rootDictionary = [NSDictionary dictionaryWithXMLParser:(NSXMLParser*)responseObject];
            
            [[NSNotificationCenter defaultCenter] postNotificationName: DataInPeriodDownloadedNotification object:nil userInfo:rootDictionary];
        } failure:nil];
        
        [operation start];
    });
}

@end
