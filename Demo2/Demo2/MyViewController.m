//
//  MyViewController.m
//  Demo2
//
//  Created by Kuba on 19.11.13.
//  Copyright (c) 2013 Kuba. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@property (atomic) int aProperty;

@end

@implementation MyViewController

int aGlobalVariable;

- (IBAction)runGlobalClicked:(id)sender
{
    aGlobalVariable = 0;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_async(queue, ^{
        while (aGlobalVariable == 0) {
            // do nothing
        }
        NSLog(@"done");
    });
    
    dispatch_async(queue, ^{
        aGlobalVariable = 1;
    });
}

- (IBAction)runPropertyClicked:(id)sender
{
    self.aProperty = 0;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        while (self.aProperty == 0) {
            // do nothing
        }
        NSLog(@"done");
    });
    
    dispatch_async(queue, ^{
        self.aProperty = 1;
    });
}

@end
