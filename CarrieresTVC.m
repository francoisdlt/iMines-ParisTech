//
//  CarrieresTVC.m
//  iMines-1
//
//  Created by François de la Taste on 21/07/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

#import "CarrieresTVC.h"
#import "HTMLViewController.h"


@implementation CarrieresTVC
@synthesize carrieresArray;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
	
	self.tableView.backgroundColor = [UIColor colorWithRed:163.0/255.0 green:196.0/255.0 blue:229.0/255.0 alpha:1];
	
	// Remplissage en hard -> TODO : plist ?
	
	carrieresArray = [[NSMutableArray alloc] init];
	
	[carrieresArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							   @"Carrières Industrielles", @"title",
							   @"carrieres-industrie", @"htmlfile",
							   @"Industrie", @"smalltitle",
							   nil]];	
	[carrieresArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							   @"Carrières Administratives", @"title",
							   @"carrieres-administration", @"htmlfile",
							   @"Administration", @"smalltitle",
							   nil]];
	[carrieresArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							   @"Carrières Scientifiques", @"title",
							   @"carrieres-sciences", @"htmlfile",
							   @"Sciences", @"smalltitle",
							   nil]];
	[carrieresArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							   @"Carrières Politiques", @"title",
							   @"carrieres-politiques", @"htmlfile",
							   @"Politique", @"smalltitle",
							   nil]];
	// Redéfinition du bouton Retour pour une meilleure lisibilité (plus court)
	
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Carrières" style:UIBarButtonItemStyleBordered target:self action:nil];
	self.navigationItem.backBarButtonItem = backButton;
	[backButton release];
	
	CGRect frame = CGRectMake(10, 260, 300, 100);
	UITextView *textView = [[UITextView alloc] initWithFrame:frame];
	[textView setFont:[UIFont systemFontOfSize:14.0f]];
	textView.text = @"Voici un recueil non exhaustif de carrières qu'ont épousées certains anciens élèves des Mines ParisTech";
	textView.backgroundColor = [UIColor clearColor];
	textView.editable = NO;
	textView.scrollEnabled = NO;
	[self.view addSubview:textView];
	
	[textView release];
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

// Ici on a autant de sections que d'entrées

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [carrieresArray count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	// à chaque section, une seule entrée
    return 1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
    
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; // chevron en fin de ligne
    cell.textLabel.text = [[carrieresArray objectAtIndex:indexPath.section] objectForKey:@"title"];
    
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
	// là encore on push un htmlviewcontroller avec la chaine html contenue dans htmlfile
	HTMLViewController *detailViewController = [[HTMLViewController alloc] initWithHTMLfilename:[[carrieresArray objectAtIndex:indexPath.section] objectForKey:@"htmlfile"]];
	detailViewController.title = [[carrieresArray objectAtIndex:indexPath.section] objectForKey:@"smalltitle"];
	
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

