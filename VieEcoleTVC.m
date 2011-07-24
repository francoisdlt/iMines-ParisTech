//
//  VieEcoleTVC.m
//  iMines-1
//
//  Created by François de la Taste on 28/12/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

#import "VieEcoleTVC.h"
#import "HTMLViewController.h"

@implementation VieEcoleTVC
@synthesize sections;

#pragma mark -
#pragma mark Initialization

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
	self.tableView.backgroundColor = [UIColor colorWithRed:163.0/255.0 green:196.0/255.0 blue:229.0/255.0 alpha:1];

	sections = [[NSMutableArray alloc] init];
	[sections addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							 @"BDE", @"title",
							 @"Bureau des Elèves", @"subtitle",
							 @"logo_bde.png", @"image",
							 @"bde", @"htmlfile",
							 nil]];
	[sections addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							 @"Forum Trium", @"title",
							 @"", @"subtitle",
							 @"logo_trium.png", @"image",
							 @"Forum-Trium", @"htmlfile",
							 nil]];
	[sections addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							 @"JuMP", @"title",
							 @"Junior-Entreprise de Mines ParisTech", @"subtitle",
							 @"icon_jump.png", @"image",
							 @"jump", @"htmlfile",
							 nil]];
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [sections count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
	cell.textLabel.text = [[sections objectAtIndex:indexPath.section] objectForKey:@"title"];
	cell.detailTextLabel.text = [[sections objectAtIndex:indexPath.section] objectForKey:@"subtitle"]; 
    cell.imageView.image = [UIImage imageNamed:[[sections objectAtIndex:indexPath.section] objectForKey:@"image"]];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// Lorsqu'on selectionne une cellule, on envoie une page contenant la chaine HTML indiquée par la clé htmlfile
	HTMLViewController *detailViewController = [[HTMLViewController alloc] initWithHTMLfilename:[[sections objectAtIndex:indexPath.section] objectForKey:@"htmlfile"]];
	detailViewController.title = [[sections objectAtIndex:indexPath.section] objectForKey:@"title"]; 
	// et hop !
	[self.navigationController pushViewController:detailViewController animated:YES];
	[detailViewController release];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[sections release];
    [super dealloc];
}


@end
