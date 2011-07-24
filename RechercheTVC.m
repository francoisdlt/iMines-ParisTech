//
//  RechercheTVC.m
//  iMines-1
//
//  Created by François de la Taste on 09/10/10.
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

#import "RechercheTVC.h"
#import "HTMLViewController.h"

@implementation RechercheTVC
@synthesize rechercheArray;
#pragma mark -
#pragma mark Initialization


- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if ((self = [super initWithStyle:style])) {
		rechercheArray = [[NSMutableArray alloc] init];
    }
    return self;
}



#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    self.tableView.backgroundColor = [UIColor colorWithRed:163.0/255.0 green:196.0/255.0 blue:229.0/255.0 alpha:1];

	
	[super viewDidLoad];
	
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Les Centres" style:UIBarButtonItemStyleBordered target:self action:nil];
	self.navigationItem.backBarButtonItem = backButton;
	[backButton release];
	
	NSMutableArray *sectionPresentation = [[NSMutableArray alloc] init];
	[sectionPresentation addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									 @"Présentation", @"title",
									 @"La Recherche en quelque mots", @"subtitle",
									 @"presentation-recherche", @"htmlfile",
									 nil]];
	
	[rechercheArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							   @"", @"sectionTitle",
							   sectionPresentation, @"contenu",
							   nil]];
	
	[sectionPresentation release];
	
	NSMutableArray *sectionSciencesTerre = [[NSMutableArray alloc] init];
	[sectionSciencesTerre addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									 @"Centre de Géosciences", @"title",
									 @"Centre de Géosciences", @"subtitle",
									 @"centre-geosciences", @"htmlfile",
									 nil]];
	[sectionSciencesTerre addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									 @"ISIGE", @"title",
									 @"Institut supérieur en ingénierie et gestion de l'environnement", @"subtitle",
									 @"isige", @"htmlfile",
									 nil]];
	[rechercheArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							   @"Sciences de la Terre et de l'Environnement", @"sectionTitle",
							   sectionSciencesTerre, @"contenu",
							   nil]];
	[sectionSciencesTerre release];
	NSMutableArray *energetique = [[NSMutableArray alloc] init];
	[energetique addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							@"CEP", @"title",
							@"Centre Enérgétique et Procédés", @"subtitle",
							@"cep", @"htmlfile",
							nil]];
	[rechercheArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							   @"Energétique et Génie des Procédés", @"sectionTitle",
							   energetique, @"contenu",
							   nil]];
	[energetique release];
	NSMutableArray *mecanique = [[NSMutableArray alloc] init];
	[mecanique addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						  @"CEMEF", @"title",
						  @"Centre de mise en forme des matériaux", @"subtitle",
						  @"cemef", @"htmlfile",
						  nil]];
	[mecanique addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						  @"LMS", @"title",
						  @"Laboratoire de Mécanique des Solides", @"subtitle",
						  @"lms", @"htmlfile",
						  nil]];
	[mecanique addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						  @"Centre des Matériaux", @"title",
						  @"Centre des Matériaux", @"subtitle",
						  @"centre-materiaux", @"htmlfile",
						  nil]];
	[rechercheArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							   @"Mécanique et Matériaux", @"sectionTitle",
							   mecanique, @"contenu",
							   nil]];
	[mecanique release];
	NSMutableArray *mathematiques = [[NSMutableArray alloc] init];
	[mathematiques addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							 @"CAS", @"title",
							 @"Centre Automatique et Systèmes", @"subtitle",
							 @"cas", @"htmlfile",
							 nil]];
	[mathematiques addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							  @"CAOR", @"title",
							  @"Centre de Robotique", @"subtitle",
							  @"caor", @"htmlfile",
							  nil]];
	[mathematiques addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							  @"CBIO", @"title",
							  @"Centre de Bio-informatique", @"subtitle",
							  @"cbio", @"htmlfile",
							  nil]];
	[mathematiques addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							  @"CMA", @"title",
							  @"Centre de Mathématiques Appliquées", @"subtitle",
							  @"cma", @"htmlfile",
							  nil]];
	[mathematiques addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							  @"CMM", @"title",
							  @"Centre de Morphologie Mathématique", @"subtitle",
							  @"cmm", @"htmlfile",
							  nil]];
	[mathematiques addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							  @"CRI", @"title",
							  @"Centre de Recherche en Informatique", @"subtitle",
							  @"cri", @"htmlfile",
							  nil]];
	[rechercheArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							   @"Mathématiques et Systèmes", @"sectionTitle",
							   mathematiques, @"contenu",
							   nil]];
	[mathematiques release];
	NSMutableArray *economie = [[NSMutableArray alloc] init];
	[economie addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							  @"CERNA", @"title",
							  @"Centre d'Economie Industrielle", @"subtitle",
							  @"cerna", @"htmlfile",
							  nil]];
	[economie addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						 @"CGS", @"title",
						 @"Centre de Gestion Scientifique", @"subtitle",
						 @"cgs", @"htmlfile",
						 nil]];
	[economie addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						 @"CRC", @"title",
						 @"Centre de Recherche sur les Risques et les Crises", @"subtitle",
						 @"crc", @"htmlfile",
						 nil]];
	[economie addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						 @"CSI", @"title",
						 @"Centre de Sociologie de l'Innovation", @"subtitle",
						 @"csi", @"htmlfile",
						 nil]];
	[rechercheArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							   @"Economie, Management, Société", @"sectionTitle",
							   economie, @"contenu",
							   nil]];
	[economie release];
	

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
    return [rechercheArray count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[[rechercheArray objectAtIndex:section] objectForKey:@"contenu"] count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
	cell.textLabel.text = [[[[rechercheArray objectAtIndex:indexPath.section] objectForKey:@"contenu"] objectAtIndex:indexPath.row] objectForKey:@"title"];
    cell.detailTextLabel.text = [[[[rechercheArray objectAtIndex:indexPath.section] objectForKey:@"contenu"] objectAtIndex:indexPath.row] objectForKey:@"subtitle"];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	// permet d'attribuer un nom à la section
	return [[rechercheArray objectAtIndex:section] objectForKey:@"sectionTitle"];
	
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
	// Lorsqu'on selectionne une cellule, on envoie une page contenant la chaine HTML indiquée par la clé htmlfile
	NSLog(@"html demandé : %@",[[[[rechercheArray objectAtIndex:indexPath.section] objectForKey:@"contenu"] objectAtIndex:indexPath.row] objectForKey:@"htmlfile"]);
	HTMLViewController *detailViewController = [[HTMLViewController alloc] initWithHTMLfilename:[[[[rechercheArray objectAtIndex:indexPath.section] objectForKey:@"contenu"] objectAtIndex:indexPath.row] objectForKey:@"htmlfile"]];
	detailViewController.title = [[[[rechercheArray objectAtIndex:indexPath.section] objectForKey:@"contenu"] objectAtIndex:indexPath.row] objectForKey:@"title"]; 
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
    [super dealloc];
}


@end

