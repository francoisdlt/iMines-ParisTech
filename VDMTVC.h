//
//  VDMTVC.h
//  iMines-1
//
//  Created by François de la Taste on 02/08/11.
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

@interface VDMTVC : UITableViewController <NSXMLParserDelegate>
{
    
    IBOutlet UITableViewCell *tvCell;
    IBOutlet UITableView * VDMTable;
    UIActivityIndicatorView *activityIndicator;
    CGSize cellSize;
    NSXMLParser * rssParser;
    NSMutableArray * stories;
    
    // a temporary item; added to the "stories" array one at a time, and cleared for the next one
    NSMutableDictionary * item;
    
    // it parses through the document, from top to bottom...
    // we collect and cache each sub-element value, and then save each item to our array.
    // we use these to track each current item, until it's ready to be added to the "stories" array
    NSString * currentElement;
    NSMutableString *currentContent, *currentAuthor, * currentNumberOfLikes , *currentNumberOfDislikes, *currentCategory;
}
@property (nonatomic, assign) IBOutlet UITableViewCell *tvCell;
@property (nonatomic, retain) IBOutlet UITableView *VDMTable;
@property (nonatomic, retain) NSMutableArray *stories;

//- (void)parseXMLFileAtURL:(NSString *)URL;

@end