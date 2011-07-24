//
//  TrombiTVC.h
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

#import <UIKit/UIKit.h>
#import "EleveWrapper.h"
#import "ASIHTTPRequest.h"

@interface TrombiTVC : UITableViewController <NSXMLParserDelegate, ASIHTTPRequestDelegate, UISearchBarDelegate> {
	
	NSMutableArray *elevesArray;
	NSMutableArray *sectionsArray;
	UILocalizedIndexedCollation *collation;
	
	NSXMLParser * rssParser;
	NSMutableArray *tempElevesArray;
	
	// a temporary item; added to the "stories" array one at a time, and cleared for the next one
	EleveWrapper *currentEleve;
	
	// it parses through the document, from top to bottom...
	// we collect and cache each sub-element value, and then save each item to our array.
	// we use these to track each current item, until it's ready to be added to the "stories" array
	NSString *currentElement;
	NSMutableString * currentNom, * currentPrenom, * currentID;
	
	NSData *listeTrombi;
    
    // pour la recherche dans le trombi
    IBOutlet UISearchBar *searchBar;
    BOOL searching;
    BOOL letUserSelectRow;
    
    NSMutableArray *searchResults;

	
}
@property (nonatomic, retain) NSMutableArray *elevesArray;
@property (nonatomic, retain) NSMutableArray *sectionsArray;
@property (nonatomic, retain) UILocalizedIndexedCollation *collation;
@property (nonatomic, retain) NSData *listeTrombi;
@property (nonatomic, retain) IBOutlet UISearchBar *searchBar;
@property (nonatomic, retain) NSMutableArray *searchResults;

- (void)parseListeTrombi;
- (void)configureSections;
- (void) searchTableView;
- (void) doneSearching_Clicked:(id)sender;

@end
