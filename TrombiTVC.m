//
//  TrombiTVC.m
//  iMines-1
//
//  Created by François de la Taste on 31/08/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

#import "TrombiTVC.h"
#import "EleveWrapper.h"
#import "asyncimageview.h"
#import "ASIFormDataRequest.h"
#import "EleveZoomTVC.h"
#import "ASIDownloadCache.h"

#define FLUX_TROMBI @"http://www.mines-paris.eu/trombi/iMines_listeEleves.php"
#define FLUX_IDENTIFICATION @"http://www.mines-paris.eu/trombi/iMines_identification.php"
#define NOMLABEL_TAG 10

@implementation TrombiTVC
@synthesize elevesArray, sectionsArray, collation, listeTrombi, searchBar, searchResults;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0,0,320,44)];
    searchBar.inputView.frame = CGRectMake(0, 0, 320-44, 30);
    searchBar.delegate = self;
    self.tableView.tableHeaderView = searchBar;
    searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(44, 0, 0, 0);;
    
    searching = NO;
    letUserSelectRow = YES;
	if ([elevesArray count] == 0) {
		
		// On récupère les identifiants : 
		NSUserDefaults *defaultSettings = [NSUserDefaults standardUserDefaults];
		NSString *userLogin = [defaultSettings stringForKey:@"login_trombi"];
		NSString *userPassword = [defaultSettings stringForKey:@"password_trombi"];
		
		if([userLogin length]==0 || [userPassword length]==0){
			// Les identifiants sont mal renseignés -> on affiche un texte de description
			UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Le Trombi" message:@"Tu as oublié le n° de chambre de Jessica ? Le Trombi du BDE est là pour toi ! On y trouve les informations importantes de chaque élève (photo, n° de tél, n° de chambre, email, etc.).\nEvidemment, seuls les Mineurs peuvent y accéder...\n\nSi tu es élève de l'école, va renseigner tes identifiants dans les Paramètres de l'iPhone" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[errorAlert show];
			[errorAlert release];
		}
		else {
			
			// Construction de la requête (tentative de connexion)
			NSURL *urlTrombi = [[NSURL alloc] initWithString:FLUX_IDENTIFICATION];
			ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:urlTrombi];
			[request setPostValue:userLogin forKey:@"id"];
			[request setPostValue:userPassword forKey:@"mdp"];
			[request setPostValue:@"TRUE" forKey:@"Submit"];
			[request setDownloadCache:[ASIDownloadCache sharedCache]];
			[request setCachePolicy:ASIOnlyLoadIfNotCachedCachePolicy];
			[request setDelegate:self];
			[request start];
			
			[urlTrombi release];
		}
		
	}
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
	// Use when fetching text data
	NSString *responseString = [request responseString];
	listeTrombi = [[NSData alloc] init];
	listeTrombi = [request responseData];
	
	//NSLog(@"Reponse : %@", data);
	
	if([responseString rangeOfString:@"Identification OK"].location != NSNotFound){
		//NSLog(@"IDENTIFICATION TROMBI OK !");
		
		[self parseListeTrombi];
		
	}
	else{
		UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Erreur :" message:@"Identifiants trombi incorrects !\nVoir Préférences iMines" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[errorAlert show];
		//[self.navigationController popViewControllerAnimated:YES];
		[errorAlert release];
	}
	
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
	NSError *error = [request error];
	NSLog(@"Erreur : %@", error);
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
    if (searching) 
    {
        return 1;
    }
    else
    {
     //return [[collation sectionTitles] count];   
        return [sectionsArray count];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	if(searching)
    {
        return [searchResults count];
    }
    else
    {
        NSArray *elevesInSection = [sectionsArray objectAtIndex:section];   
        return [elevesInSection count];
    }
	
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"EleveCellWithImage";
	UILabel *nomLabel;
	AsyncImageView *asyncImage;
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        // On charge le label nom
		CGRect frameLabel;
		frameLabel.size.width=320-50;
		frameLabel.size.height=44;
		frameLabel.origin.x=50;
		frameLabel.origin.y=0;
		
		nomLabel = [[[UILabel alloc] initWithFrame:frameLabel] autorelease];
		
		nomLabel.highlightedTextColor = [UIColor whiteColor];
		nomLabel.font = [UIFont boldSystemFontOfSize: 14.0];
		nomLabel.textAlignment = UITextAlignmentLeft;
		nomLabel.textColor = [UIColor darkGrayColor];
		nomLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
		nomLabel.backgroundColor = [UIColor clearColor];
		nomLabel.tag = NOMLABEL_TAG;
		
		[cell.contentView addSubview:nomLabel];
		
		
		
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	else {
		nomLabel = (UILabel *)[cell.contentView viewWithTag:NOMLABEL_TAG];
		AsyncImageView * oldImage = (AsyncImageView*)[cell.contentView viewWithTag:999];
		[oldImage removeFromSuperview];
		
    }
	// On charge le ImageView
	CGRect frame;
	frame.size.width=44; frame.size.height=44;
	frame.origin.x=0; frame.origin.y=0;
	asyncImage = [[AsyncImageView alloc] initWithFrame:frame];
	asyncImage.tag = 999;
	[cell.contentView addSubview:asyncImage];
    EleveWrapper *eleve;
    if(searching)
    {
       // NSLog(@"search results : %@", searchResults);
        eleve = [searchResults objectAtIndex:indexPath.row]; 
    }
    else
    {
        NSArray *elevesInSection = [sectionsArray objectAtIndex:indexPath.section];
        eleve = [elevesInSection objectAtIndex:indexPath.row];
    }    
	nomLabel.text = [[eleve.nom uppercaseString] stringByAppendingFormat:@" %@",[eleve.prenom capitalizedString]];
	
	NSURL* url = [NSURL URLWithString:[@"http://www.mines-paris.eu/trombi/get_44px_image.php?login=" stringByAppendingString:eleve.eleveID]];
	[asyncImage loadImageFromURL:url];
	return cell;
	
}


/*
 Section-related methods: Retrieve the section titles and section index titles from the collation.
 */

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(searching)
    {
        return @"";
    }
    else {
        return [[collation sectionTitles] objectAtIndex:section];
    }
}


- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [collation sectionIndexTitles];
}


- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [collation sectionForSectionIndexTitleAtIndex:index];
}



#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	
	EleveWrapper *eleve;
    if(searching)
    {
        eleve = [searchResults objectAtIndex:indexPath.row];
    }
    else
    {
        eleve = [[sectionsArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    }
    
	EleveZoomTVC *detailViewController = [[EleveZoomTVC alloc] initWithLogin:eleve.eleveID nom:eleve.nom prenom:eleve.prenom];
	// ...
	// Pass the selected object to the new view controller.
	[self.navigationController pushViewController:detailViewController animated:YES];
	[detailViewController release];
	
	//[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -
#pragma mark Gestion de la recherche dans la liste

- (void) searchBarTextDidBeginEditing:(UISearchBar *)theSearchBar {
    
    searching = YES;
    letUserSelectRow = NO;
    self.tableView.scrollEnabled = NO;
    
    //Add the done button.
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                               target:self action:@selector(doneSearching_Clicked:)] autorelease];
}

- (NSIndexPath *)tableView :(UITableView *)theTableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(letUserSelectRow)
        return indexPath;
    else
        return nil;
}

- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText {
    
    //Remove all objects first.
    searchResults = [[NSMutableArray alloc] init];
    //[searchResults removeAllObjects];
    
    if([searchText length] > 0) {
        
        searching = YES;
        letUserSelectRow = YES;
        self.tableView.scrollEnabled = YES;
        [self searchTableView];
    }
    else {
        
        searching = NO;
        letUserSelectRow = NO;
        self.tableView.scrollEnabled = NO;
    }
    
    [self.tableView reloadData];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)theSearchBar {
    
    [self searchTableView];
}

- (void) searchTableView {
    
    NSString *searchText = searchBar.text;
    //NSLog(@"Search Text : %@", searchText);
    NSMutableArray *searchArray = [[NSMutableArray alloc] init];
    
    for (NSArray *elevesInSection in sectionsArray)
    {
        [searchArray addObjectsFromArray:elevesInSection];
    }
    
    for (EleveWrapper *eleve in searchArray)
    {
        //NSLog(@"Looking for '%@' in '%@'",searchText, eleve.nom);
        NSRange titleResultsRangeForNom = [eleve.nom rangeOfString:searchText options:NSCaseInsensitiveSearch];
        NSRange titleResultsRangeForPrenom = [eleve.prenom rangeOfString:searchText options:NSCaseInsensitiveSearch];
        
        if (titleResultsRangeForNom.length > 0 || titleResultsRangeForPrenom.length > 0)
        {
            //NSLog(@"added %@",eleve.nom);
            [searchResults addObject:eleve];
            //NSLog(@"search results count :%d",[searchResults count]);
        }
    }
    
    [searchArray release];
    searchArray = nil;
    //NSLog(@"end of searchTableView method");
}

- (void) doneSearching_Clicked:(id)sender {
    
    searchBar.text = @"";
    [searchBar resignFirstResponder];
    
    letUserSelectRow = YES;
    searching = NO;
    self.navigationItem.rightBarButtonItem = nil;
    self.tableView.scrollEnabled = YES;
    
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark Data management

- (void)setElevesArray:(NSMutableArray *)newDataArray {
	//NSLog(@"setElevesArray called !");
	if (newDataArray != elevesArray) {
		[elevesArray release];
		elevesArray = [newDataArray retain];
	}
	if (elevesArray == nil) {
		self.sectionsArray = nil;
	}
	else {
		[self configureSections];
	}
}


- (void)configureSections {
	
	// Get the current collation and keep a reference to it.
	self.collation = [UILocalizedIndexedCollation currentCollation];
	
	NSInteger index, sectionTitlesCount = [[collation sectionTitles] count];
	
	NSMutableArray *newSectionsArray = [[NSMutableArray alloc] initWithCapacity:sectionTitlesCount];
	
	// Set up the sections array: elements are mutable arrays that will contain the time zones for that section.
	for (index = 0; index < sectionTitlesCount; index++) {
		NSMutableArray *array = [[NSMutableArray alloc] init];
		[newSectionsArray addObject:array];
		[array release];
	}
	
	// Segregate the time zones into the appropriate arrays.
	for (EleveWrapper *eleve in elevesArray) {
		
		// Ask the collation which section number the time zone belongs in, based on its locale name.
		NSInteger sectionNumber = [collation sectionForObject:eleve collationStringSelector:@selector(nom)];
		
		// Get the array for the section.
		NSMutableArray *sectionEleves = [newSectionsArray objectAtIndex:sectionNumber];
		
		//  Add the time zone to the section.
		[sectionEleves addObject:eleve];
	}
	
	// Now that all the data's in place, each section array needs to be sorted.
	for (index = 0; index < sectionTitlesCount; index++) {
		
		NSMutableArray *elevesArrayForSection = [newSectionsArray objectAtIndex:index];
		
		// If the table view or its contents were editable, you would make a mutable copy here.
		NSArray *sortedElevesArrayForSection = [collation sortedArrayFromArray:elevesArrayForSection collationStringSelector:@selector(nom)];
		
		// Replace the existing array with the sorted array.
		[newSectionsArray replaceObjectAtIndex:index withObject:sortedElevesArrayForSection];
	}
	
	self.sectionsArray = newSectionsArray;
	[newSectionsArray release];	
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

#pragma mark -
#pragma mark RSS Parsing

- (void)parseListeTrombi {
	
	//On lance le activity indicator
	//[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	
	tempElevesArray = [[NSMutableArray alloc] init];
	
	//you must then convert the path to a proper NSURL or it won't work
	//NSURL *xmlURL = [NSURL URLWithString:URL];
	
	// here, for some reason you have to use NSClassFromString when trying to alloc NSXMLParser, otherwise you will get an object not found error
	// this may be necessary only for the toolchain
	rssParser = [[NSXMLParser alloc] initWithData:listeTrombi];
	
	// Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
	[rssParser setDelegate:self];
	
	// Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
	[rssParser setShouldProcessNamespaces:NO];
	[rssParser setShouldReportNamespacePrefixes:NO];
	[rssParser setShouldResolveExternalEntities:NO];
	
	[rssParser parse];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser {
	//NSLog(@"found file and started parsing");
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSString * errorString = [NSString stringWithFormat:@"Problème de téléchargement ! (Error code %i )", [parseError code]];
	NSLog(@"error parsing XML: %@", errorString);
	
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Erreur :" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	[errorAlert show];
	[errorAlert release];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
	//NSLog(@"found this element: %@", elementName);
	currentElement = [elementName copy];
	
	if ([elementName isEqualToString:@"eleve"]) { // Si on tombe sur une nouvelle entrée
		// clear out our story item caches...
		currentEleve = [[EleveWrapper alloc] init];
		currentNom = [[NSMutableString alloc] init];
		currentPrenom = [[NSMutableString alloc] init];
		currentID = [[NSMutableString alloc] init];
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
	
	//NSLog(@"ended element: %@", elementName);
	if ([elementName isEqualToString:@"eleve"]) {
		
		// save values to an item, then store that item into the array...
		
		currentEleve.nom = currentNom;
		currentEleve.prenom = currentPrenom;
		currentEleve.eleveID = currentID;
		
		[tempElevesArray addObject:[currentEleve copy]];
		//NSLog(@"adding eleve: %@", currentNom);
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	//NSLog(@"found characters: %@", string);
	// save the characters for the current item...
	if ([currentElement isEqualToString:@"nom"]) {
		[currentNom appendString:string];
	} else if ([currentElement isEqualToString:@"prenom"]) {
		[currentPrenom appendString:string];
	} else if ([currentElement isEqualToString:@"id"]) {
		[currentID appendString:string];
	}	
	
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	//NSLog(@"all done!");
	//NSLog(@"eleves array has %d items", [tempElevesArray count]);
	if([tempElevesArray count] <= 1) { // Si on a un ou zero elève, il faut retenter l'identification.
		// Tentative de connexion au trombi : 
		NSUserDefaults *defaultSettings = [NSUserDefaults standardUserDefaults];
		NSString *userLogin = [defaultSettings stringForKey:@"login_trombi"];
		NSString *userPassword = [defaultSettings stringForKey:@"password_trombi"];
		
		// Construction de la requête
		NSURL *urlTrombi = [[NSURL alloc] initWithString:FLUX_IDENTIFICATION];
		ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:urlTrombi];
		[urlTrombi release];
		[request setPostValue:userLogin forKey:@"id"];
		[request setPostValue:userPassword forKey:@"mdp"];
		[request setPostValue:@"TRUE" forKey:@"Submit"];
		[request setDelegate:self];
		[request start];
	}
	else {
		[self setElevesArray:tempElevesArray];
		[self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
	}
	
}

- (void)dealloc {
	[elevesArray release];
	[sectionsArray release];
	[collation release];
	[listeTrombi release];
    [super dealloc];
    [searchBar release];
    [searchResults release];
}


@end

