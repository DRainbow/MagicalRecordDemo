//
//  RootViewController.h
//  MagicalRecordDemo
//
//  Created by apple on 13-10-31.
//  Copyright (c) 2013年 tyq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *inputField;
- (IBAction)createRecord:(id)sender;
- (IBAction)readRecord:(id)sender;

+ (RootViewController *)getInstance;

@end
