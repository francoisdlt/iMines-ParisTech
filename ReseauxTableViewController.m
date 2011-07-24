//
//  ReseauxTableViewController.m
//  iMines-1
//
//  Created by François de la Taste on 17/07/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

#import "ReseauxTableViewController.h"
#import "HTMLViewController.h"


@implementation ReseauxTableViewController
@synthesize reseauxArray;


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
	self.tableView.backgroundColor = [UIColor colorWithRed:163.0/255.0 green:196.0/255.0 blue:229.0/255.0 alpha:1];

	// Remplissage de la table en hard -> TODO : plist ?
	reseauxArray = [[NSMutableArray alloc] init];
	[reseauxArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							 @"Mines ParisTech Alumni", @"title",
							 @"Les Anciens des Mines", @"subtitle",
							 @"logominesparistechalumni.jpg", @"image",
							 @"anciens", @"htmlfile",
							 nil]];
	[reseauxArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							 @"ParisTech", @"title",
							 @"Institut des sciences et technologies de Paris", @"subtitle",
							 @"ParisTech.png", @"image",
							 @"paristech", @"htmlfile",
							 nil]];
	[reseauxArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							 @"GEM", @"title",
							 @"Groupe des Ecoles des Mines", @"subtitle",
							 @"gem.gif", @"image",
							 @"gem", @"htmlfile",
							 nil]];
	[reseauxArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							 @"ARMINES", @"title",
							 @"Association de Recherche contractuelle des Mines", @"subtitle",
							 @"armines.gif", @"image",
							 @"armines", @"htmlfile",
							 nil]];
	[reseauxArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							 @"Institut Carnot", @"title",
							 @"Actions de recherche pour la Technologie et la Société", @"subtitle",
							 @"carnot-small.png", @"image",
							 @"institut-carnot", @"htmlfile",
							 nil]];

	// Redéfinition du bouton Retour pour une meilleure lisibilité (plus court)
	
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Réseaux" style:UIBarButtonItemStyleBordered target:self action:nil];
	self.navigationItem.backBarButtonItem = backButton;
	[backButton release];
	
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
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [reseauxArray count];
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
    
    cell.textLabel.text = [[reseauxArray objectAtIndex:indexPath.section] objectForKey:@"title"];
	cell.detailTextLabel.text = [[reseauxArray objectAtIndex:indexPath.section] objectForKey:@"subtitle"]; 
    cell.imageView.image = [UIImage imageNamed:[[reseauxArray objectAtIndex:indexPath.section] objectForKey:@"image"]];
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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
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
	// Lorsqu'on selectionne une cellule, on envoie une page contenant la chaine HTML indiquée par la clé htmlfile
	 HTMLViewController *detailViewController = [[HTMLViewController alloc] initWithHTMLfilename:[[reseauxArray objectAtIndex:indexPath.section] objectForKey:@"htmlfile"]];
	detailViewController.title = [[reseauxArray objectAtIndex:indexPath.section] objectForKey:@"title"]; 
	// et hop !
	[self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 
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
	[reseauxArray release];
    [super dealloc];
}


@end

