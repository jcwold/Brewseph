//
//  Yeast.h
//  Brewseph
//
//  Created by Al Wold on 12/29/14.
//  Copyright (c) 2014 Brewseph World Industries. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Recipe;

@interface Yeast : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Recipe *recipe;

@end
