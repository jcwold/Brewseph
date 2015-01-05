//
//  Hop.h
//  Brewseph
//
//  Created by Al Wold on 1/4/15.
//  Copyright (c) 2015 Brewseph World Industries. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Recipe;

@interface Hop : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * ounces;
@property (nonatomic, retain) NSNumber * time;
@property (nonatomic, retain) Recipe *recipe;

@end
