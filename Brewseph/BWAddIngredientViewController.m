//
//  BWAddIngredient.m
//  Brewseph
//
//  Created by John Wold on 12/14/14.
//  Copyright (c) 2014 Brewseph World Industries. All rights reserved.
//

#import "BWAddIngredientViewController.h"
#import "BWGrains.h"
#import "BWHops.h"
#import "BWYeast.h"

@interface BWAddIngredientViewController ()
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) BWGrains *grain;
@property (strong, nonatomic) BWHops *hop;
@property (strong, nonatomic) BWYeast *yeast;
@property (strong, nonatomic) NSNumber *weightSelection;

@end

@implementation BWAddIngredientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.grain = [[BWGrains alloc]init];
    self.hop = [[BWHops alloc]init];
    self.yeast = [[BWYeast alloc]init];
    
    self.ounces = [[NSMutableArray alloc] initWithObjects:@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16, nil];
    self.fractions = [[NSMutableArray alloc] initWithObjects:@"1/4",@"1/2",@"3/4", nil];
    self.addIngredientTitle.title = [NSString stringWithFormat:@"Add %@", self.type];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return 2;
    }
    else if (component == 1) {
        return [self.ounces count];
    }
    else {
        return [self.fractions count];
    }
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (component == 0) {
        if (row == 0) {
            return @"Ounces";
        }
        else {
            return @"Pounds";
        }
        
    }
    else if (component == 1) {
        return [NSString stringWithFormat:@"%@ oz", [self.ounces objectAtIndex:row]];
    }
    else {
        return [self.fractions objectAtIndex:row];
    }
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    self.weightSelection = [self.ounces objectAtIndex:row];
    
}
- (IBAction)savePressed:(id)sender {
    
    if ([self.type isEqual:@"Grain"]) {
        
        self.grain.name = self.nameTextField.text;
        self.grain.ounces = [self.weightSelection intValue];
        [self.recipe.grains addObject:self.grain];
        [self dismissViewControllerAnimated:YES completion:^{}];
    }
    else if ([self.type isEqual:@"Hop"]) {
        self.hop.name = self.nameTextField.text;
        self.hop.ounces = [self.weightSelection floatValue];
        [self.recipe.hops addObject:self.hop];
        [self dismissViewControllerAnimated:YES completion:^{}];
    }
    else if ([self.type isEqual:@"Yeast" ]) {
        self.yeast.name = self.nameTextField.text;
        [self.recipe.yeast addObject:self.yeast];
        [self dismissViewControllerAnimated:YES completion:^{}];
    }
    
}
- (IBAction)cancelPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{}];
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
