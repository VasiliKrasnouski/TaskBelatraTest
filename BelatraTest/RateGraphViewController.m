//
//  RateGraphViewController.m
//  BelatraTest
//
//  Created by FanLee on 29/03/16.
//  Copyright © 2016 Vasili Krasnouski. All rights reserved.
//

#import "RateGraphViewController.h"
//#import "UIViewController+BButton.h"

@interface RateGraphViewController ()

@end

@implementation RateGraphViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //CGRect frame = CGRectMake(0, 40, 320, 200);
    self.edgesForExtendedLayout = UIRectEdgeNone;
    _ratesValues = [NSMutableArray new];
    _ratesDates = [NSMutableArray new];
    [self _setupExampleGraph];
    
        // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_setupExampleGraph {
    
    for (NSDictionary *dictElement in _ratesArray) {
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        
        NSNumber *rateVal = [formatter numberFromString:[dictElement valueForKey:@"Rate"]];
        
        NSString *month = @" ";
    
        [_ratesValues addObject:rateVal];
        [_ratesDates addObject:month];
    }
    
    self.data = @[_ratesValues];
    
   
    self.labels = _ratesDates;
   
    
    self.graph.dataSource = self;
    self.graph.lineWidth = 3.0;
    
    self.graph.valueLabelCount = 20;
    
    
    [self.graph draw];
}
- (UIColor *)colorForLineAtIndex:(NSInteger)index {
    id colors = @[[UIColor gk_turquoiseColor],
                  [UIColor gk_peterRiverColor],
                  [UIColor gk_alizarinColor],
                  [UIColor gk_sunflowerColor]
                  ];
    return [colors objectAtIndex:index];
}
-(NSInteger)numberOfLines{
    return [_data count];
}

-(NSArray *)valuesForLineAtIndex:(NSInteger)index{
    
    return [_data objectAtIndex:index];
}
-(NSString *)titleForLineAtIndex:(NSInteger)index{
    return [_labels objectAtIndex:index];
}


@end
