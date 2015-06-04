//
//  BWRecipeViewController.m
//  Brewseph
//
//  Created by John Wold on 12/3/14.
//  Copyright (c) 2014 Brewseph World Industries. All rights reserved.
//

#import "BWRecipeViewController.h"
#import "Recipe.h"
#import "Grain.h"
#import "Hop.h"
#import "Yeast.h"
#import "BWAddIngredientViewController.h"
#import "AppDelegate.h"

@interface BWRecipeViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *titleTextField;



@end

@implementation BWRecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ViewDidLoad");
    self.titleTextField.text = self.recipe.name;
    self.tableView.dataSource = self;
    
        
    
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
        Grain *currentGrain;
        currentGrain = [self.recipe.grains objectAtIndex:indexPath.row];
        tableCell.textLabel.text = currentGrain.name;
        tableCell.detailTextLabel.text = [self formatGrainWeight:[currentGrain.ounces intValue]];
    }
    
    else if (indexPath.section == 1) {
        tableCell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        Hop *currentHop;
        currentHop = [self.recipe.hops objectAtIndex:indexPath.row];
        tableCell.textLabel.text = currentHop.name;
        tableCell.detailTextLabel.text = [NSString stringWithFormat:@"%f oz", [currentHop.ounces floatValue]];
    }
    
    else if (indexPath.section == 2) {
        tableCell =[self.tableView dequeueReusableCellWithIdentifier:@"yeastCell" forIndexPath:indexPath];
        Yeast *currentYeast;
        currentYeast = [self.recipe.yeasts objectAtIndex:indexPath.row];
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
        return [self.recipe.yeasts count];
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
- (IBAction)cancelPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{}];

}


- (IBAction)savePressed:(id)sender {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *moc = appDelegate.managedObjectContext;
    self.recipe.name = self.titleTextField.text;
    NSError *error;
    [moc save:&error];
    
    [self dismissViewControllerAnimated:YES completion:^{}];
    
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
