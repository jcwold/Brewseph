//
//  Recipe.h
//  Brewseph
//
//  Created by Al Wold on 1/4/15.
//  Copyright (c) 2015 Brewseph World Industries. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Grain, Hop, Yeast;

@interface Recipe : NSManagedObject

@property (nonatomic, retain) NSDate * dateCreated;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSOrderedSet *grains;
@property (nonatomic, retain) NSOrderedSet *hops;
@property (nonatomic, retain) NSOrderedSet *yeasts;
@end

@interface Recipe (CoreDataGeneratedAccessors)

- (void)insertObject:(Grain *)value inGrainsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromGrainsAtIndex:(NSUInteger)idx;
- (void)insertGrains:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeGrainsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInGrainsAtIndex:(NSUInteger)idx withObject:(Grain *)value;
- (void)replaceGrainsAtIndexes:(NSIndexSet *)indexes withGrains:(NSArray *)values;
- (void)addGrainsObject:(Grain *)value;
- (void)removeGrainsObject:(Grain *)value;
- (void)addGrains:(NSOrderedSet *)values;
- (void)removeGrains:(NSOrderedSet *)values;
- (void)insertObject:(Hop *)value inHopsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromHopsAtIndex:(NSUInteger)idx;
- (void)insertHops:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeHopsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInHopsAtIndex:(NSUInteger)idx withObject:(Hop *)value;
- (void)replaceHopsAtIndexes:(NSIndexSet *)indexes withHops:(NSArray *)values;
- (void)addHopsObject:(Hop *)value;
- (void)removeHopsObject:(Hop *)value;
- (void)addHops:(NSOrderedSet *)values;
- (void)removeHops:(NSOrderedSet *)values;
- (void)insertObject:(Yeast *)value inYeastsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromYeastsAtIndex:(NSUInteger)idx;
- (void)insertYeasts:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeYeastsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInYeastsAtIndex:(NSUInteger)idx withObject:(Yeast *)value;
- (void)replaceYeastsAtIndexes:(NSIndexSet *)indexes withYeasts:(NSArray *)values;
- (void)addYeastsObject:(Yeast *)value;
- (void)removeYeastsObject:(Yeast *)value;
- (void)addYeasts:(NSOrderedSet *)values;
- (void)removeYeasts:(NSOrderedSet *)values;
@end
