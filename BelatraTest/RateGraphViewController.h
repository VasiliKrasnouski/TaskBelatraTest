//
//  RateGraphViewController.h
//  BelatraTest
//
//  Created by FanLee on 29/03/16.
//  Copyright © 2016 Vasili Krasnouski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphKit.h"

@interface RateGraphViewController : UIViewController<GKLineGraphDataSource>

@property (nonatomic, strong) IBOutlet GKLineGraph *graph;

@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) NSArray *labels;
@property (nonatomic, strong) NSMutableArray *ratesArray;
@property (nonatomic, strong) NSMutableArray *ratesValues;
@property (nonatomic, strong) NSMutableArray *ratesDates;

//- (IBAction)onButtonDraw:(id)sender;


@end
