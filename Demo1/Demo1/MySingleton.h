//
//  MySingleton.h
//  Demo1
//
//  Created by Kuba on 19.11.13.
//  Copyright (c) 2013 Kuba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySingleton : NSObject

@property (atomic) NSInteger value;

+ (id)sharedInstance;
- (NSInteger)increment;

@end
