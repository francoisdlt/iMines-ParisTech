//
//  AssosTVC.m
//  iMines-1
//
//  Created by François de la Taste on 31/08/10.
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

#import "AssosTVC.h"
#import "HTMLViewController.h"

@implementation AssosTVC


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	arrayAssos = [[NSMutableArray alloc] init];
	[arrayAssos addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						   @"Bureau des Elèves", @"title",
						   @"presentation_BDE", @"htmlfilename",
						   @"logo_bde.png", @"icon",
						   nil]];
	[arrayAssos addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						   @"Forum Trium", @"title",
						   @"Forum-Trium", @"htmlfilename",
						   @"logo_trium.png", @"icon",
						   nil]];
	[arrayAssos addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						   @"JuMP", @"title",
						   @"article_jump", @"htmlfilename",
						   @"icon_jump.png", @"icon",
						   nil]];
	[arrayAssos addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						   @"ASTI", @"title",
						   @"article_asti", @"htmlfilename",
						   @"icon_asti.png", @"icon",
						   nil]];
	[arrayAssos addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						   @"BDS", @"title",
						   @"Article_BDS", @"htmlfilename",
						   @"icon_BDS.png", @"icon",
						   nil]];
	[arrayAssos addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						   @"BDA", @"title",
						   @"Article_BDA", @"htmlfilename",
						   @"icon_BDA.png", @"icon",
						   nil]];
	[arrayAssos addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						   @"MediaMines", @"title",
						   @"article_mediamines", @"htmlfilename",
						   @"icon_MediaMines.png", @"icon",
						   nil]];
	[arrayAssos addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						   @"Zánbinou", @"title",
						   @"Article_zambinou", @"htmlfilename",
						   @"icon_zambinou.jpg", @"icon",
						   nil]];
	[arrayAssos addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						   @"MoRU", @"title",
						   @"Article_Moru", @"htmlfilename",
						   @"icon_moru.png", @"icon",
						   nil]];
	[arrayAssos addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						   @"MineShake", @"title",
						   @"Article_MineShake", @"htmlfilename",
						   @"icon_MineShake.png", @"icon",
						   nil]];
	[arrayAssos addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						   @"Kâlimat", @"title",
						   @"Article_kalimat", @"htmlfilename",
						   @"icon_kalimat.png", @"icon",
						   nil]];
	[arrayAssos addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						   @"CERes", @"title",
						   @"Article_CERES", @"htmlfilename",
						   @"icon_ceres.png", @"icon",
						   nil]];
	[arrayAssos addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						   @"Biéro", @"title",
						   @"article_biero", @"htmlfilename",
						   @"icone_biero.png", @"icon",
						   nil]];
	[arrayAssos addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						   @"RIVOTRA", @"title",
						   @"article_rivotra", @"htmlfilename",
						   @"icon_rivotra.png", @"icon",
						   nil]];
	[arrayAssos addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						   @"Ski Club", @"title",
						   @"article_skiclub", @"htmlfilename",
						   @"icon_skiclub.png", @"icon",
						   nil]];
	[arrayAssos addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						   @"Cté Chrétienne", @"title",
						   @"laCC", @"htmlfilename",
						   @"icon_CC.png", @"icon",
						   nil]];
	[arrayAssos addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						   @"CAV", @"title",
						   @"article_cav", @"htmlfilename",
						   @"icon_cav.png", @"icon",
						   nil]];
	[arrayAssos addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						   @"Club Thé", @"title",
						   @"article_clubthe", @"htmlfilename",
						   @"icon_clubthe.png", @"icon",
						   nil]];
	[arrayAssos addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						   @"Club Chocolat", @"title",
						   @"club-chocolat", @"htmlfilename",
						   @"icon_clubchocolat.png", @"icon",
						   nil]];
	[arrayAssos addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						   @"Club PT", @"title",
						   @"club-pt", @"htmlfilename",
						   @"icon_clubPT.png", @"icon",
						   nil]];
	[arrayAssos addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						   @"Cap sur le Phare Ouest", @"title",
						   @"article_phareouest", @"htmlfilename",
						   @"", @"icon",
						   nil]];
	// Redéfinition du bouton Retour pour une meilleure lisibilité (plus court)
	
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Assos" style:UIBarButtonItemStyleBordered target:self action:nil];
	self.navigationItem.backBarButtonItem = backButton;
	[backButton release];	
	
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
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [arrayAssos count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [[arrayAssos objectAtIndex:indexPath.row] objectForKey:@"title"];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.imageView.image = [UIImage imageNamed:[[arrayAssos objectAtIndex:indexPath.row] objectForKey:@"icon"]];
    
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
	
	HTMLViewController *detailViewController = [[HTMLViewController alloc] initWithHTMLfilename:[[arrayAssos objectAtIndex:indexPath.row] objectForKey:@"htmlfilename"]];
	detailViewController.title = [[arrayAssos objectAtIndex:indexPath.row] objectForKey:@"title"];
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

