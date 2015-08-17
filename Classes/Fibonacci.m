//
//  Fibonacci.m
//  TestProject
//
//  Created by Bitcats on 13/08/15.
//  Copyright (c) 2015 TWalenciak. All rights reserved.
//

#import "Fibonacci.h"

@implementation Fibonacci

+ (int)getFibonacciNumberFor:(int)pos
{
    
    if (pos == 0) {
        return 0;
    }
    
    if (pos == 1) {
        return 1;
    }
    
    int lastlast = 0;
    int last = 1;
    
    int tmp;
    for (int i = 2; i <= pos ; i++) {
        tmp = last;
        last = last + lastlast;
        lastlast = tmp;
    }
    
    return last;
}

@end
