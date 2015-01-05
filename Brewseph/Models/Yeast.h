//
//  Yeast.h
//  Brewseph
//
//  Created by Al Wold on 1/4/15.
//  Copyright (c) 2015 Brewseph World Industries. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Recipe;

@interface Yeast : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Recipe *recipe;

@end
