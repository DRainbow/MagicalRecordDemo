//
//  SecondViewController.h
//  MagicalRecordDemo
//
//  Created by apple on 13-10-31.
//  Copyright (c) 2013年 tyq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableViewShow;
@property (strong, nonatomic) NSMutableArray *dataList;

+ (SecondViewController *)getInstance;

@end
