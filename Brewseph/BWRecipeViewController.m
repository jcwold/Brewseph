//
//  BWRecipeViewController.m
//  Brewseph
//
//  Created by John Wold on 12/3/14.
//  Copyright (c) 2014 Brewseph World Industries. All rights reserved.
//

#import "BWRecipeViewController.h"

@interface BWRecipeViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BWRecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *tableCell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
   
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
    
    return 1;
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
