//
//  BWRecipeViewController.h
//  Brewseph
//
//  Created by John Wold on 12/3/14.
//  Copyright (c) 2014 Brewseph World Industries. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"

@interface BWRecipeViewController : UIViewController <UITableViewDataSource, UIActionSheetDelegate>
@property (strong, nonatomic) Recipe *recipe;
@property (nonatomic) BOOL isNew;

@end
