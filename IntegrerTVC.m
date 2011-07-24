//
//  IntegrerTVC.m
//  iMines-1
//
//  Created by François de la Taste on 22/11/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

#import "IntegrerTVC.h"
#import "HTMLViewController.h"
#import "MastersTVC.h"
#import "DoctoratsTVC.h"

@implementation IntegrerTVC
@synthesize sections;

#pragma mark -
#pragma mark Initialization

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if ((self = [super initWithStyle:style])) {
    }
    return self;
}
*/


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
	self.tableView.backgroundColor = [UIColor colorWithRed:163.0/255.0 green:196.0/255.0 blue:229.0/255.0 alpha:1];

    [super viewDidLoad];
	// Initialisation du tableau des sections
	if([sections count]==0){
	sections = [[NSMutableArray alloc] init];
	
	// Remplissage des sections de la page Intégrer
	
	[sections addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						 @"Admission sur concours" , @"title",
						 @"Concours Commun Mines-Ponts", @"subtitle",
						 @"ccmp", @"htmlfilename",
						 @"html", @"tag",
						 nil]];
	[sections addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						 @"Admission par V.U." , @"title",
						 @"Voie Universitaire", @"subtitle",
						 @"ast", @"htmlfilename",
						 @"html", @"tag",
						 nil]];
	[sections addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						 @"Corps des Mines" , @"title",
						 @"Corps techniques de l’État à MINES ParisTech", @"subtitle",
						 @"corps", @"htmlfilename",
						 @"html", @"tag",
						 nil]];
		
	[sections addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						 @"Mastères Spécialisés" , @"title",
						 @"MS à temps plein ou temps partiel", @"subtitle",
						 @"", @"htmlfilename",
						 @"MASTERS", @"tag",
						 nil]];
	[sections addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						 @"Doctorat" , @"title",
						 @"", @"subtitle",
						 @"", @"htmlfilename",
						 @"DOCTORATS", @"tag",
						 nil]];
		
	}
	
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
    // Return YES for supported orientations
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
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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
	
	NSString *tag = [[sections objectAtIndex:indexPath.section] objectForKey:@"tag"];
	if([tag isEqualToString:@"html"]) {
		HTMLViewController *htmlVC = [[HTMLViewController alloc] initWithHTMLfilename:[[sections objectAtIndex:indexPath.section] objectForKey:@"htmlfilename"]];
		htmlVC.title = [[sections objectAtIndex:indexPath.section] objectForKey:@"title"];
		[self.navigationController pushViewController:htmlVC animated:YES];
		[htmlVC release];
	}
	else if ([tag isEqualToString:@"MASTERS"]) {
		MastersTVC *mtvc = [[MastersTVC alloc] initWithStyle:UITableViewStyleGrouped];
		mtvc.title = @"Mastères Spécialisés";
		[self.navigationController pushViewController:mtvc animated:YES];
		[mtvc release];
	}
	else if ([tag isEqualToString:@"DOCTORATS"]) {
		DoctoratsTVC *dtvc = [[DoctoratsTVC alloc] initWithStyle:UITableViewStyleGrouped];
		dtvc.title = @"Doctorats";
		[self.navigationController pushViewController:dtvc animated:YES];
		[dtvc release];
	}
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	[sections release];
}


@end

