//
//  EditViewController.m
//  LearnObjC
//
//  Created by José Andy Quintero Melo on 15/12/2016.
//  Copyright © 2016 Nomasystems. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

-(void) updateSaveButtonState;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Additional setup after loading the view.
    self.navigationController.navigationBar.tintColor = self.navigationItem.rightBarButtonItem.tintColor;
    
    //self.navigationController.navigationItem.leftBarButtonItem
    
    self.txtAge.delegate = self;
    self.txtLastname.delegate = self;
    self.txtFirstname.delegate = self;
    
    if (_person != nil){
        [self.navigationItem setTitle:_person.firstname];
        [_txtFirstname setText:_person.firstname];
        [_txtLastname setText:_person.lastname];
        [_txtAge setText:[NSString stringWithFormat:@"%d",_person.age]];
    }
    
    [self updateSaveButtonState];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation


- (IBAction)saveInfo:(id)sender {

    //[self.delegate editingWasFinished];
    
}

- (IBAction)cancel:(UIBarButtonItem *)sender {
    if ([self.presentingViewController isKindOfClass:[UINavigationController class]]){
        [self dismissViewControllerAnimated:TRUE completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:TRUE];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    UIBarButtonItem * buttonSave = (UIBarButtonItem *) sender;
    if (buttonSave == self.saveButton) {
        self.person = [[Person alloc]init];
        [self.person setFirstname:self.txtFirstname.text];
        [self.person setLastname:self.txtLastname.text];
        [self.person setAge:self.txtAge.text.intValue];
    } else {
        return;
    }
}

#pragma mark - EditTextDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [_saveButton setEnabled:FALSE];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self updateSaveButtonState];
    [self.navigationItem setTitle:_txtFirstname.text];
}

#pragma mark - Private Methods

-(void)updateSaveButtonState {
    if (_txtFirstname.text != nil && _txtLastname != nil && _txtAge != nil){
        [_saveButton setEnabled:(![_txtFirstname.text isEqualToString:@""] &&
                                ![_txtLastname.text isEqualToString:@""] &&
                                ![_txtAge.text isEqualToString:@""])];
    }
}

@end
