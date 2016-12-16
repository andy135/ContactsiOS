//
//  ViewController.h
//  LearnObjC
//
//  Created by José Andy Quintero Melo on 15/12/2016.
//  Copyright © 2016 Nomasystems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditViewController.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tablePeople;

- (IBAction)addNewPerson:(id)sender;

@end

