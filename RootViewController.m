//
//  RootViewController.m
//  MagicalRecordDemo
//
//  Created by apple on 13-10-31.
//  Copyright (c) 2013年 tyq. All rights reserved.
//

#import "RootViewController.h"

#import "SecondViewController.h"
#import "DataInput.h"

static RootViewController *singletonInstance = nil;

@interface RootViewController ()

@end

@implementation RootViewController

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
    
    self.inputField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createRecord:(id)sender {
    DataInput *dataInput = [DataInput MR_createEntity];
    dataInput.data = self.inputField.text;
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

- (IBAction)readRecord:(id)sender {
//    [self.navigationController pushViewController:[SecondViewController getInstance] animated:YES];
//    NSLog(@"%@",self.navigationController.viewControllers);
}

+ (RootViewController *)getInstance {
    @synchronized(self){
        if (singletonInstance == nil) {
            singletonInstance = [[self alloc] init];
        }
    }
    return singletonInstance;
}

+ (id)alloc {
    @synchronized(self){
        if (singletonInstance ==nil) {
            singletonInstance = [super alloc];
        }
        return singletonInstance;
    }
    return nil;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.inputField resignFirstResponder];
}



@end
