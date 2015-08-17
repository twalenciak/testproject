//
//  FibonnacciTableController.h
//  TestProject
//
//  Created by Bitcats on 13/08/15.
//  Copyright (c) 2015 TWalenciak. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FibonacciTableDelegate <NSObject>

- (void)fibonacciTableDidSelectIndex:(int)index;

@end

@interface FibonnacciTableController : UITableViewController

@property (nonatomic, weak) id<FibonacciTableDelegate> eventDelegate;

@end
