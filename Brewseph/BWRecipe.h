//
//  BWRecipe.h
//  Brewseph
//
//  Created by John Wold on 11/5/14.
//  Copyright (c) 2014 Brewseph World Industries. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BWRecipe : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDate *dateCreated;
@property (strong, nonatomic) NSMutableArray *hops;
@property (strong, nonatomic) NSMutableArray *grains;
@property (strong, nonatomic) NSMutableArray *yeast;


@end
