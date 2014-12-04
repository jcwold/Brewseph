//
//  BWRecipeViewController.m
//  Brewseph
//
//  Created by John Wold on 12/3/14.
//  Copyright (c) 2014 Brewseph World Industries. All rights reserved.
//

#import "BWRecipeViewController.h"
#import "BWRecipe.h"
#import "BWGrains.h"
#import "BWHops.h"
#import "BWYeast.h"

@interface BWRecipeViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) BWRecipe *recipe;

@end

@implementation BWRecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    
    self.recipe = [[BWRecipe alloc]init];
    self.recipe.name = @"Kolsch";
    self.recipe.grains = [[NSMutableArray alloc] init];
    self.recipe.hops = [[NSMutableArray alloc]init];
    self.recipe.yeast = [[NSMutableArray alloc]init];
    
    BWGrains *grains = [[BWGrains alloc]init];
    BWGrains *oats = [[BWGrains alloc]init];
    BWHops *hops = [[BWHops alloc]init];
    BWYeast *yeast = [[BWYeast alloc]init];
    
    grains.name = @"Pale";
    grains.ounces = 88;

    oats.name = @"Oats";
    oats.ounces = 8;
    
    [self.recipe.grains addObject:grains];
    [self.recipe.grains addObject:oats];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *tableCell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
   
    if (indexPath.section == 0) {
        BWGrains *currentGrain = [[BWGrains alloc]init];
        currentGrain = [self.recipe.grains objectAtIndex:indexPath.row];
        tableCell.textLabel.text = currentGrain.name;
        tableCell.detailTextLabel.text = [NSString stringWithFormat:@"%d oz", currentGrain.ounces];
    }
    
    else if (indexPath.section == 1) {
        BWHops *currentHop = [[BWHops alloc]init];
        currentHop = [self.recipe.hops objectAtIndex:0];
        tableCell.textLabel.text = currentHop.name;
    }
    
    
    return tableCell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
 
    if (section == 0) {
        return @"Grains";
    }
    else if (section == 1) {
        return @"Hops";
    }
    else {
        return @"Yeast";
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return [self.recipe.grains count];
    }
    else if (section == 1){
        return [self.recipe.hops count];
    }
    else {
        return [self.recipe.yeast count];
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
