//
//  MyViewController.m
//  Demo1
//
//  Created by Kuba on 19.11.13.
//  Copyright (c) 2013 Kuba. All rights reserved.
//

#import "MyViewController.h"
#import "MySingleton.h"

@interface MyViewController ()

@property IBOutlet UILabel *label;

@end

@implementation MyViewController

- (IBAction)runSingleClicked:(id)sender
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSLog(@"start");
        for (int i = 0; i < 30; i++) {
            self.label.text = [NSString stringWithFormat:@"%d", i];
            usleep(100000);
        }
        NSLog(@"end");
    });
}

- (IBAction)runMultipleClicked:(id)sender
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_apply(30000, queue, ^(size_t i) {
        MySingleton *s = [MySingleton sharedInstance];
        [s increment];
    });
 
    MySingleton *s = [MySingleton sharedInstance];
    self.label.text = [NSString stringWithFormat:@"%d", s.value];
}

@end
