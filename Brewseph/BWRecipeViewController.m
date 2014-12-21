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
#import "BWAddIngredientViewController.h"

@interface BWRecipeViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) BWRecipe *recipe;


@end

@implementation BWRecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ViewDidLoad");
    
    self.tableView.dataSource = self;
    
    self.recipe = [[BWRecipe alloc]init];
    self.recipe.name = @"Kolsch";
    self.recipe.grains = [[NSMutableArray alloc] init];
    self.recipe.hops = [[NSMutableArray alloc]init];
    self.recipe.yeast = [[NSMutableArray alloc]init];
    
    BWGrains *pale = [[BWGrains alloc]init];
    BWGrains *oats = [[BWGrains alloc]init];
    pale.name = @"Pale";
    pale.ounces = 32;
    oats.name = @"Oats";
    oats.ounces = 34;
    
    
    BWHops *centennial = [[BWHops alloc]init];
    centennial.name = @"Centennial";
    centennial.ounces = 1;
    
    BWYeast *brewersYeast = [[BWYeast alloc]init];
    brewersYeast.name = @"Brewer's Yeast";
    
    [self.recipe.grains addObject:pale];
    [self.recipe.grains addObject:oats];
    [self.recipe.hops addObject:centennial];
    [self.recipe.yeast addObject:brewersYeast];
    
    
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *tableCell;
    
    if (indexPath.section == 0) {
        tableCell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        BWGrains *currentGrain = [[BWGrains alloc]init];
        currentGrain = [self.recipe.grains objectAtIndex:indexPath.row];
        tableCell.textLabel.text = currentGrain.name;
        tableCell.detailTextLabel.text = [self formatGrainWeight:currentGrain.ounces];
    }
    
    else if (indexPath.section == 1) {
        tableCell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        BWHops *currentHop = [[BWHops alloc]init];
        currentHop = [self.recipe.hops objectAtIndex:indexPath.row];
        tableCell.textLabel.text = currentHop.name;
        tableCell.detailTextLabel.text = [NSString stringWithFormat:@"%f oz", currentHop.ounces];
    }
    
    else if (indexPath.section == 2) {
        tableCell =[self.tableView dequeueReusableCellWithIdentifier:@"yeastCell" forIndexPath:indexPath];
        BWYeast *currentYeast = [[BWYeast alloc]init];
        currentYeast = [self.recipe.yeast objectAtIndex:indexPath.row];
        tableCell.textLabel.text = currentYeast.name;
    }
    
    return tableCell;
}

- (NSString *)formatGrainWeight:(int)weight
{
    NSString *stringWeight;
    
    int pounds = weight/16;
    int ounces = weight%16;
    
    if (pounds > 0 && ounces != 0) {
        stringWeight = [NSString stringWithFormat:@"%i lbs %i oz", pounds, ounces];
        return stringWeight;
        
    }
    else if (pounds > 0 ) {
        stringWeight = [NSString stringWithFormat:@"%i lbs", pounds];
        return stringWeight;

    }
    
    else {
        stringWeight = [NSString stringWithFormat:@"%i oz", ounces];
        return stringWeight;
    }
    

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BWAddIngredientViewController *vc = [segue destinationViewController];
    vc.recipe = self.recipe;
    NSNumber *buttonIndexNumber = sender;
    int buttonIndex = buttonIndexNumber.intValue;
    if (buttonIndex == 0) {
        NSLog(@"You want to add a grain ingredient");
        vc.type = @"Grain";
    }
    if (buttonIndex == 1) {
        NSLog(@"You want to add a hop ingredient");
        vc.type = @"Hop";
    }
    if (buttonIndex == 2) {
        NSLog(@"You want to add a yeast ingredient");
        vc.type = @"Yeast";
    }
    
}


- (IBAction)addPressed:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles: @"Grains", @"Hops", @"Yeast", nil];
    
    [actionSheet showInView:self.view];
    
                                  
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        [actionSheet dismissWithClickedButtonIndex: actionSheet.cancelButtonIndex animated:YES];
    }
    
    else {
        [self performSegueWithIdentifier:@"ingredientSegue" sender:@(buttonIndex)];
    }

}


@end
