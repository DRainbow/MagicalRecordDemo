//
//  SecondViewController.m
//  MagicalRecordDemo
//
//  Created by apple on 13-10-31.
//  Copyright (c) 2013年 tyq. All rights reserved.
//

#import "SecondViewController.h"

#import "DataInput.h"

static SecondViewController *singletonInstance;

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.tableViewShow.dataSource = self;
    self.tableViewShow.delegate = self;
    
    NSArray *allRecords = [DataInput MR_findAll];
    self.dataList = [[NSMutableArray alloc] initWithArray:allRecords];
//    NSLog(@"All Records: %@",allRecords);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellWithIdentifier];
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text = ((DataInput *)[self.dataList objectAtIndex:row]).data;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

+ (SecondViewController *)getInstance {
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:Nil];
    return [story instantiateViewControllerWithIdentifier:@"SecondViewController"];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DataInput *dataInput = [self.dataList objectAtIndex:indexPath.row];
    [dataInput MR_deleteEntity];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    
    [self.dataList removeObjectAtIndex:indexPath.row];

    [self.tableViewShow deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

@end
