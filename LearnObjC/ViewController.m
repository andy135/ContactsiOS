//
//  ViewController.m
//  LearnObjC
//
//  Created by José Andy Quintero Melo on 15/12/2016.
//  Copyright © 2016 Nomasystems. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property NSMutableArray *people;

- (void) loadSampleData;

- (IBAction) unwindToListWithSender:(UIStoryboardSegue *)sender;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Make self delegate of table view
    self.tablePeople.delegate = self;
    self.tablePeople.dataSource = self;
    
    _people = [[NSMutableArray alloc] init];
    
    //Load sample data
    [self loadSampleData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Delegate and DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _people.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Dequeue the cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCellRecord" forIndexPath:indexPath];
    
    Person *p = [_people objectAtIndex:indexPath.row];
    if (p != nil) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", p.firstname, p.lastname];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Age: %d", p.age];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"idAddSegue"]){
        
    } else if ([segue.identifier isEqualToString:@"idEditSegue"]){
        UITableViewCell * cell = (UITableViewCell *) sender;
        NSIndexPath * indexPath = [_tablePeople indexPathForCell:cell];
        Person * p = [_people objectAtIndex:indexPath.row];
        EditViewController * editViewController = [segue destinationViewController];
        [editViewController setPerson:p];
    }
    
    //editViewController.delegate = self;
}

#pragma mark - Private Methods

- (void) loadSampleData{
    Person *p1 = [[Person alloc] initWithAll:@"Andy" lastname:@"Quintero" age:21];
    Person *p2 = [[Person alloc] initWithAll:@"Ruben" lastname:@"Montero" age:22];
    [_people addObject:p1];
    [_people addObject:p2];
    
    [self.tablePeople reloadData];
}

#pragma mark - Blocks


//ObjC Block
void (^logBlock)(void) = ^{
    NSLog(@"Button clicked");
};

#pragma mark - Actions

- (IBAction)addNewPerson:(id)sender {
    [self performSegueWithIdentifier:@"idSegueEdit" sender:self];
}

- (IBAction) unwindToListWithSender:(UIStoryboardSegue *)sender {
    EditViewController * editViewController = (EditViewController *) sender.sourceViewController;
    
    NSIndexPath * selectedIndexPath = [_tablePeople indexPathForSelectedRow];
    if (selectedIndexPath != nil) {
        [_people replaceObjectAtIndex:selectedIndexPath.row withObject:editViewController.person];
        NSArray * array = [[NSArray alloc] initWithObjects:selectedIndexPath, nil];
        [_tablePeople reloadRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationNone];
    } else {
        NSIndexPath * newIndexPath = [NSIndexPath indexPathForRow:_people.count inSection:0];
        NSArray * array = [[NSArray alloc] initWithObjects:newIndexPath, nil];
        [_people addObject:editViewController.person];
        [_tablePeople insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
}

@end
