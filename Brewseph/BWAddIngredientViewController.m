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
@property (strong, nonatomic) NSMutableArray *fractionSymbols;
@property (strong, nonatomic) NSMutableArray *fractions;
@property (strong, nonatomic) NSMutableArray *ounces;
@property (strong, nonatomic) NSMutableArray *pounds;

@end

@implementation BWAddIngredientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.type isEqualToString:@"Yeast"]) {
        self.ouncesPicker.hidden = YES;
    }
    
    self.grain = [[BWGrains alloc]init];
    self.hop = [[BWHops alloc]init];
    self.yeast = [[BWYeast alloc]init];
    self.pounds = [[NSMutableArray alloc] initWithObjects:@1,@2,@3,@4,@5,@6,@7,@8,@9,@10, @11, @12, @13,@14, @15,@16,@17,@18,@19,@20, nil];
    self.ounces = [[NSMutableArray alloc] initWithObjects: @1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16, nil];
    self.fractionSymbols = [[NSMutableArray alloc] initWithObjects:@"0", [NSString stringWithFormat:@"%C",0x00215b], [NSString stringWithFormat:@"%C",0x002153],[NSString stringWithFormat:@"%C",0x00bc],[NSString stringWithFormat:@"%C",0x00bd],[NSString stringWithFormat:@"%C",0x002154],[NSString stringWithFormat:@"%C",0x00be], nil];
    self.fractions = [[NSMutableArray alloc] initWithObjects:@0,@0.125,@0.25, @0.3333333,@0.5,@0.6666666667,@0.75, nil];
    self.addIngredientTitle.title = [NSString stringWithFormat:@"Add %@", self.type];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0 && [self.type isEqualToString:@"Hop"]) {
        return [self.ounces count];
    }
    else if (component == 1 && [self.type isEqualToString:@"Hop"]) {
        return [self.fractionSymbols count];
    }
    
    else if (component == 0 && [self.type isEqualToString:@"Grain"]){
        return [self.pounds count];
    }
    else if (component == 1 && [self.type isEqualToString:@"Grain"]){
        return [self.ounces count];
    }
    else {
        return 0;
    }
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
  
    if (component == 0 && [self.type isEqualToString:@"Hop"]) {
        return [NSString stringWithFormat:@"%@", [self.ounces objectAtIndex:row]];
    }
    else if (component ==1 && [self.type isEqualToString:@"Hop"]) {
        return [NSString stringWithFormat:@"%@ oz", [self.fractionSymbols objectAtIndex:row]];
    }
    
    else if (component == 0 && [self.type isEqualToString:@"Grain"]){
        return [NSString stringWithFormat:@"%@ lb", [self.pounds objectAtIndex:row]];
    }
    
    else if (component == 1 && [self.type isEqualToString:@"Grain"]){
        return [NSString stringWithFormat:@"%@ oz", [self.ounces objectAtIndex:row]];
    }
    else {
        return nil;
    }
    
}


- (IBAction)savePressed:(id)sender {
    
    NSInteger pickerSelection = 0;
    NSInteger componentTwo = 0;
    
    if ([self.type isEqual:@"Grain"]) {
        
        self.grain.name = self.nameTextField.text;
        pickerSelection = [self.ouncesPicker selectedRowInComponent:0];
        componentTwo = [self.ouncesPicker selectedRowInComponent:1];
        self.grain.ounces = [[self.pounds objectAtIndex:pickerSelection] intValue]*16 + [[self.ounces objectAtIndex:componentTwo] intValue];
        [self.recipe.grains addObject:self.grain];
        [self dismissViewControllerAnimated:YES completion:^{}];
    }
    else if ([self.type isEqual:@"Hop"]) {
        self.hop.name = self.nameTextField.text;
        pickerSelection = [self.ouncesPicker selectedRowInComponent:0];
        componentTwo = [self.ouncesPicker selectedRowInComponent:1];
        self.hop.ounces = [[self.ounces objectAtIndex:pickerSelection] floatValue] + [[self.fractions objectAtIndex:componentTwo] floatValue];
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
