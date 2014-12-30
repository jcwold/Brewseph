//
//  Hop.h
//  Brewseph
//
//  Created by Al Wold on 12/29/14.
//  Copyright (c) 2014 Brewseph World Industries. All rights reserved.
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
