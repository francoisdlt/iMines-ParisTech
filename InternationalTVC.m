//
//  InternationalTVC.m
//  iMines-1
//
//  Created by François de la Taste on 18/10/10.
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

#import "InternationalTVC.h"
#import "HTMLViewController.h"


@implementation InternationalTVC
@synthesize arrayInternational;

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
	arrayInternational = [[NSMutableArray alloc] init];
	[arrayInternational addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   @"Accueil étudiants étrangers", @"title",
								   @"Admis sur Titre, ERASMUS, doctorats, etc.", @"subtitle",
								   @"etudiants-etrangers", @"htmlfilename",
								   nil]];
	[arrayInternational addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   @"ATHENS", @"title",
								   @"Programme d'échanges étudiants en Europe", @"subtitle",
								   @"athens", @"htmlfilename",
								   nil]];
	[arrayInternational addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   @"S3 à l'étranger", @"title",
								   @"Prendre un semestre dans une université étrangère", @"subtitle",
								   @"S3-etranger", @"htmlfilename",
								   nil]];
	[arrayInternational addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   @"Année de césure", @"title",
								   @"Un an pour réfléchir à son parcours", @"subtitle",
								   @"cesure", @"htmlfilename",
								   nil]];
	[arrayInternational addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   @"Voyager avec l'école", @"title",
								   @"De nombreux cours proposent des excursions", @"subtitle",
								   @"partir-avec-ecole", @"htmlfilename",
								   nil]];
								   
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
    return [arrayInternational count];
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
    
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; // chevron en fin de ligne
    cell.textLabel.text = [[arrayInternational objectAtIndex:indexPath.section] objectForKey:@"title"];
	cell.detailTextLabel.text = [[arrayInternational objectAtIndex:indexPath.section] objectForKey:@"subtitle"];
    
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
	// là encore on push un htmlviewcontroller avec la chaine html contenue dans htmlfile
	HTMLViewController *detailViewController = [[HTMLViewController alloc] initWithHTMLfilename:[[arrayInternational objectAtIndex:indexPath.section] objectForKey:@"htmlfilename"]];
	detailViewController.title = [[arrayInternational objectAtIndex:indexPath.section] objectForKey:@"title"];
	
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
    [super dealloc];
}


@end

