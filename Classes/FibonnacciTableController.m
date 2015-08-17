//
//  FibonnacciTableController.m
//  TestProject
//
//  Created by Bitcats on 13/08/15.
//  Copyright (c) 2015 TWalenciak. All rights reserved.
//

#import "FibonnacciTableController.h"

#import "FibonacciCell.h"

#import "Fibonacci.h"

@implementation FibonnacciTableController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cellTV forRowAtIndexPath:(NSIndexPath *)indexPath
{
    FibonacciCell *cell = (FibonacciCell *)cellTV;
    
    int fibValue = [Fibonacci getFibonacciNumberFor:(int)indexPath.row];
    
    cell.fibLabel.text = [NSString stringWithFormat:@"%d", fibValue];
    
    NSTextAlignment align =  fibValue % 2 == 0 ? NSTextAlignmentLeft : NSTextAlignmentRight;
    cell.fibLabel.textAlignment = align;
    
    
    BOOL isEven = indexPath.row % 2 == 0;
    
    UIColor *color = isEven ? [UIColor blueColor] : [UIColor redColor];
    cell.contentView.backgroundColor = color;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FibonacciCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FibCell" forIndexPath:indexPath];

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_eventDelegate && [_eventDelegate respondsToSelector:@selector(fibonacciTableDidSelectIndex:)]) {
        [_eventDelegate fibonacciTableDidSelectIndex:(int)indexPath.row];
    }
}

@end
