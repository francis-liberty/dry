//
//  AutosizeViewController.h
//  Autosize
//
//  Created by FrancisChan on 11/24/12.
//  Copyright (c) 2012 FrancisChan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutosizeViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *foos;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *bars;

@end
