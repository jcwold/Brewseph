//
//  Recipe.h
//  Brewseph
//
//  Created by Al Wold on 12/29/14.
//  Copyright (c) 2014 Brewseph World Industries. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Grain;

@interface Recipe : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * dateCreated;
@property (nonatomic, retain) NSManagedObject *hops;
@property (nonatomic, retain) Grain *grains;
@property (nonatomic, retain) NSManagedObject *yeasts;

@end
