//
//  EleveZoomTVC.h
//  iMines-1
//
//  Created by François de la Taste on 20/12/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "ASIHTTPRequest.h"


@interface EleveZoomTVC : UITableViewController <NSXMLParserDelegate, ASIHTTPRequestDelegate, MFMailComposeViewControllerDelegate> {

	NSMutableArray *eleve;
	NSString *eleveLogin;
	NSString *eleveNom;
	NSString *elevePrenom;
	
	NSXMLParser * rssParser;
	NSString *currentElement;
	
	int compteur;
	
}
@property (nonatomic, retain) NSMutableArray *eleve;

-(id)initWithLogin:(NSString *)login nom:(NSString *)nom prenom:(NSString *)prenom;
-(void)displayComposerSheet:(NSString *)recipient;
- (NSString *)getCurrentAnneeScolaire;
@end
