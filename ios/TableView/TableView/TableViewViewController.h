//
//  TableViewViewController.h
//  TableView
//
//  Created by FrancisChan on 11/25/12.
//  Copyright (c) 2012 FrancisChan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewViewController : UIViewController
    <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray* listData;

@end
