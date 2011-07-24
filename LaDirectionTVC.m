//
//  LaDirectionTVC.m
//  iMines-1
//
//  Created by François de la Taste on 22/07/10.
/*
This file is part of iMines ParisTech.

iMines ParisTech is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

iMines ParisTech is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#import "LaDirectionTVC.h"
#import "DirectionZoomVC.h"

@implementation LaDirectionTVC
@synthesize directionArray, annuaireDirection;

#pragma mark -
#pragma mark Initialization

- (id) init {
	
	return [self initWithStyle:UITableViewStyleGrouped];
}

- (id) initWithStyle:(UITableViewStyle)style{
	
	directionArray = [[NSMutableArray alloc] init];
	
	// On charge le contenu de Direction.plist dans annuaireDirection
	NSString *path = [[NSBundle mainBundle] pathForResource:@"Direction" ofType:@"plist"];
	annuaireDirection = [[NSDictionary alloc] initWithContentsOfFile:path];
	// pour afficher le directeur, on peut faire :
	return [super initWithStyle:style];
}

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

	// Remplissage Paris en semi-hard
	NSMutableArray *sectionParis = [[NSMutableArray alloc] init];
	[sectionParis addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							 @"Direction", @"title",
							 [annuaireDirection objectForKey:@"Direction"], @"contenu",
							 [[annuaireDirection objectForKey:@"Direction"] objectForKey:@"nom"],@"subtitle",
							 nil]];
	[sectionParis addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							 @"Direction des Etudes", @"title",
							 [annuaireDirection objectForKey:@"Direction des Etudes"], @"contenu",
							 [[annuaireDirection objectForKey:@"Direction des Etudes"] objectForKey:@"nom"],@"subtitle",
							 nil]];
	[sectionParis addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							 @"Direction des corps techniques de l'Etat", @"title",
							 [annuaireDirection objectForKey:@"Direction des corps techniques de l'Etat"], @"contenu",
							 [[annuaireDirection objectForKey:@"Direction des corps techniques de l'Etat"] objectForKey:@"nom"],@"subtitle",
							 nil]];
	[sectionParis addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							 @"Direction de la Recherche", @"title",
							 [annuaireDirection objectForKey:@"Direction de la Recherche"], @"contenu",
							 [[annuaireDirection objectForKey:@"Direction de la Recherche"] objectForKey:@"nom"],@"subtitle",
							 nil]];
	[sectionParis addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							 @"Secrétariat Général", @"title",
							 [annuaireDirection objectForKey:@"Secrétariat Général"], @"contenu",
							 [[annuaireDirection objectForKey:@"Secrétariat Général"] objectForKey:@"nom"],@"subtitle",
							 nil]];
	[sectionParis addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							 @"Agent Comptable", @"title",
							 [annuaireDirection objectForKey:@"Agent Comptable"], @"contenu",
							 [[annuaireDirection objectForKey:@"Agent Comptable"] objectForKey:@"nom"],@"subtitle",
							 nil]];
	[sectionParis addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							 @"Direction de la Communication", @"title",
							 [annuaireDirection objectForKey:@"Direction de la Communication"], @"contenu",
							 [[annuaireDirection objectForKey:@"Direction de la Communication"] objectForKey:@"nom"],@"subtitle",
							 nil]];
	
	// ajout Paris
	[directionArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							   sectionParis, @"section",
							   @"Paris",	@"sectionName",
							   nil]];
	[sectionParis release];
	
	// Remplissage	Délégation d'Evry
	
	NSMutableArray *sectionEvry = [[NSMutableArray alloc] init];
	[sectionEvry addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							@"Délégation d'Evry", @"title",
							[annuaireDirection objectForKey:@"Délégation d'Evry"], @"contenu",
							[[annuaireDirection objectForKey:@"Délégation d'Evry"] objectForKey:@"nom"],@"subtitle",
							nil]];
	
	// Ajout Delegation Evry
	
	[directionArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							   sectionEvry, @"section",
							   @"Evry", @"sectionName",
							   nil]];
	[sectionEvry release];
	
	// Remplissage	Délégation Fontainebleau
	
	NSMutableArray *sectionFontainebleau = [[NSMutableArray alloc] init];
	[sectionFontainebleau addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									 @"Délégation de Fontainebleau", @"title",
									 [annuaireDirection objectForKey:@"Délégation de Fontainebleau"], @"contenu",
									 [[annuaireDirection objectForKey:@"Délégation de Fontainebleau"] objectForKey:@"nom"], @"subtitle",
									 nil]];
	
	// Ajout Delegation Fontainebleau
	
	[directionArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							   sectionFontainebleau, @"section",
							   @"Fontainebleau", @"sectionName",
							   nil]];
	[sectionFontainebleau release];
	
	// Remplissage	Délégation Sophia Antipolis
	
	NSMutableArray *sectionSophia = [[NSMutableArray alloc] init];
	[sectionSophia addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							  @"Délégation de Sophia Antipolis", @"title",
							  [annuaireDirection objectForKey:@"Délégation de Sophia Antipolis"], @"contenu",
							  [[annuaireDirection objectForKey:@"Délégation de Sophia Antipolis"] objectForKey:@"nom"], @"subtitle",
							  nil]];
	
	// Ajout Delegation Sophia Antipolis
	
	[directionArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							   sectionSophia, @"section",
							   @"Sophia Antipolis", @"sectionName",
							   nil]];
	[sectionSophia release];
	
	
	
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

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (YES);
}



#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
	// Une section par entrée de direction
    return [directionArray count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	// On compte le nombre d'elements dans la section indiquée
    return [[[directionArray objectAtIndex:section] objectForKey:@"section"] count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    // bon là il faut s'accrocher pour naviguer dans le tableau directionArray
	cell.textLabel.text = [[[[directionArray objectAtIndex:indexPath.section] objectForKey:@"section"] objectAtIndex:indexPath.row] objectForKey:@"title"];
	cell.detailTextLabel.text = [[[[directionArray objectAtIndex:indexPath.section] objectForKey:@"section"] objectAtIndex:indexPath.row] objectForKey:@"subtitle"];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	// permet d'attribuer un nom à la section
	return [[directionArray objectAtIndex:section] objectForKey:@"sectionName"];
	
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
	
	DirectionZoomVC *detailViewController = [[DirectionZoomVC alloc] initWithInfos:[[[directionArray objectAtIndex:indexPath.section] objectForKey:@"section"] objectAtIndex:indexPath.row]];
	detailViewController.title = [[[[directionArray objectAtIndex:indexPath.section] objectForKey:@"section"] objectAtIndex:indexPath.row] objectForKey:@"title"];
	// ...
	// Pass the selected object to the new view controller.
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
	[directionArray release];
	[annuaireDirection release];
    [super dealloc];
}


@end

