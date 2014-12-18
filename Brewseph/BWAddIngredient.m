//
//  BWAddIngredient.m
//  Brewseph
//
//  Created by John Wold on 12/14/14.
//  Copyright (c) 2014 Brewseph World Industries. All rights reserved.
//

#import "BWAddIngredient.h"

@interface BWAddIngredient ()

@end

@implementation BWAddIngredient

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.ounces = [[NSMutableArray alloc] initWithObjects:@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16, nil];
    self.fractions = [[NSMutableArray alloc] initWithObjects:@"1/4",@"1/2",@"3/4", nil];
    self.addIngredientTitle.title = @"Add Grains";
    
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
