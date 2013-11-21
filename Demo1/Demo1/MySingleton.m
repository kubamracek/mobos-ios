//
//  MySingleton.m
//  Demo1
//
//  Created by Kuba on 19.11.13.
//  Copyright (c) 2013 Kuba. All rights reserved.
//

#import "MySingleton.h"

@implementation MySingleton

+ (id)sharedInstance
{
    static MySingleton *instance;
    if (! instance) instance = [MySingleton new];
    return instance;
}

- (NSInteger)increment
{
    self.value += 1;
    return self.value;
}

@end
