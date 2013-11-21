//
//  MyViewController.m
//  Demo3
//
//  Created by Kuba on 21.11.13.
//  Copyright (c) 2013 Kuba. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@property IBOutlet UIScrollView *scroller;

@end

@implementation MyViewController

- (IBAction)startDownload:(id)sender
{
    srand(time(NULL));
    
    NSArray *urls = @[
                      @"https://www.kernel.org/pub/linux/kernel/v3.x/patch-3.11.9.xz?1",
                      @"https://www.kernel.org/pub/linux/kernel/v3.x/patch-3.11.9.xz?2",
                      @"https://www.kernel.org/pub/linux/kernel/v3.x/patch-3.11.9.xz?3",
                      @"https://www.kernel.org/pub/linux/kernel/v3.x/patch-3.11.9.xz?4",
                      @"https://www.kernel.org/pub/linux/kernel/v3.x/patch-3.11.9.xz?5",
                      @"https://www.kernel.org/pub/linux/kernel/v3.x/patch-3.11.9.xz?6",
                      @"https://www.kernel.org/pub/linux/kernel/v3.x/patch-3.11.9.xz?7",
                      @"https://www.kernel.org/pub/linux/kernel/v3.x/patch-3.11.9.xz?8",
                      @"https://www.kernel.org/pub/linux/kernel/v3.x/patch-3.11.9.xz?9",
                      @"https://www.kernel.org/pub/linux/kernel/v3.x/patch-3.11.9.xz?10",
                      ];
    
    int y = 0;
    for (NSString *strUrl in urls) {
        
        NSString *strUrl2 = [strUrl stringByAppendingFormat:@"%d", rand()];
        
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        indicator.frame = CGRectMake(0, y, 320, 30);
        y += 30;
        indicator.hidesWhenStopped = NO;
        [indicator startAnimating];
        [self.scroller addSubview:indicator];
        
        NSURL *url = [NSURL URLWithString:strUrl2];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(queue, ^{
            NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            NSLog(@"done: %d", data.length);
            dispatch_async(dispatch_get_main_queue(), ^{
                [indicator stopAnimating];
            });
        });
    }
    
    self.scroller.contentSize = CGSizeMake(320, y);
}

@end
