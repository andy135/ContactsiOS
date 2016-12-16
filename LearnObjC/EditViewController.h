//
//  EditViewController.h
//  LearnObjC
//
//  Created by José Andy Quintero Melo on 15/12/2016.
//  Copyright © 2016 Nomasystems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface EditViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtFirstname;
@property (weak, nonatomic) IBOutlet UITextField *txtLastname;
@property (weak, nonatomic) IBOutlet UITextField *txtAge;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@property Person *person;

- (IBAction)saveInfo:(id)sender;
- (IBAction)cancel:(UIBarButtonItem *)sender;


@end
