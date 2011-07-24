//
//  PresseTVC.m
//  iMines-1
//
//  Created by François de la Taste on 27/12/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

#import "PresseTVC.h"
#import "ASIDownloadCache.h"
#import "StandardWebView.h"

#define FLUX_PRESSE @"http://www.ensmp.fr/Fr/Actualites/CommuniquesPresse/communiques.html"

@implementation PresseTVC


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
    [super viewDidLoad];
	self.tableView.backgroundColor = [UIColor colorWithRed:163.0/255.0 green:196.0/255.0 blue:229.0/255.0 alpha:1];

	NSString *pathToCommuniques = FLUX_PRESSE;
	NSURL *url = [NSURL URLWithString:pathToCommuniques];
	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
	[request setDelegate:self];
	[request setDownloadCache:[ASIDownloadCache sharedCache]];
	[request startAsynchronous];
	
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark -
#pragma mark ASIHTTPRequest Delegate 

- (void)requestFinished:(ASIHTTPRequest *)request
{
	// Use when fetching text data
	NSString *responseString = [request responseString];
	int positionDebutUL = [responseString rangeOfString:@"<ul>"].location;
	int positionFinUL = [responseString rangeOfString:@"</ul>"].location;
	
	if(positionDebutUL == 0 || positionFinUL==0){
		// erreur	
	}
	else{
		communiques = [[NSMutableArray alloc] init];
		NSRange range = {positionDebutUL, positionFinUL - positionDebutUL + 6};
		responseString = [responseString substringWithRange:range]; // On coupe jusqu'au début de la liste ordonnée
		//NSLog(@"REPONSE ELAGUEE : %@",responseString);
		
		NSScanner *scanner;
		
		NSString *STRINGAVANTPDF = @"<li><a href=\"";
		NSString *STRINGAPRESPDF = @"\">";
		NSString *STRINGFINLIGNE = @"</A>";
		
		NSString *adressePDF;
		NSString *descriptionCommunique;
		
		NSArray *composantsDate;
		NSString *date, *annee, *mois, *jour;
		
		NSMutableDictionary *item;
		
		scanner = [NSScanner scannerWithString:responseString];
		
		while ([scanner isAtEnd] == NO){
			if([scanner scanUpToString:STRINGAVANTPDF intoString:NULL] &&
			   [scanner scanString:STRINGAVANTPDF intoString:NULL] &&
			   [scanner scanUpToString:STRINGAPRESPDF intoString:&adressePDF] &&
			   [scanner scanString:STRINGAPRESPDF intoString:NULL] &&
			   [scanner scanUpToString:STRINGFINLIGNE intoString:&descriptionCommunique]) {
			
				date = [adressePDF stringByReplacingOccurrencesOfString:@"Communiquedepresse" withString:@""];
				date = [date stringByReplacingOccurrencesOfString:@".pdf" withString:@""];
				date = [date stringByReplacingOccurrencesOfString:@".doc" withString:@""];
				
				composantsDate = [date componentsSeparatedByString:@"-"];
				
				annee = [composantsDate objectAtIndex:0];
				mois = [composantsDate objectAtIndex:1];
				jour = [composantsDate objectAtIndex:2];
				
				date = [NSString stringWithFormat:@"%@/%@/%@", jour, mois, annee];
				
				item = [[NSMutableDictionary alloc] init];
				
				[item setObject:descriptionCommunique forKey:@"description"];
				[item setObject:adressePDF forKey:@"adressePDF"];
				[item setObject:date forKey:@"date"];				
				
				[communiques addObject:[item copy]];
				
			}
		}
		[self.tableView reloadData];
	}
	
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
	NSError *error = [request error];
	NSLog(@"error : %@", error);
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
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [communiques count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
	cell.textLabel.text = [[communiques objectAtIndex:indexPath.row] objectForKey:@"date"];
	cell.detailTextLabel.text = [[communiques objectAtIndex:indexPath.row] objectForKey:@"description"];
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
    
	NSString *pathToPDF = [@"http://www.ensmp.fr/Fr/Actualites/CommuniquesPresse/" stringByAppendingString:[[communiques objectAtIndex:indexPath.row] objectForKey:@"adressePDF"]];
	//NSLog(@"path : %@", pathToPDF); 
	StandardWebView *detailViewController = [[StandardWebView alloc] initWithURLString:pathToPDF];
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
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

