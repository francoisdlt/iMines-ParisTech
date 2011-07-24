//
//  SurLaMine.m
//  iMines-1
//
//  Created by François de la Taste on 14/07/10.
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

#import "SurLaMine.h"
#import "ReseauxTableViewController.h"
#import "HTMLViewController.h"
#import "CarrieresTVC.h"
#import "ChiffresCles.h"
#import "LaDirectionTVC.h"
#import "RechercheTVC.h"
#import "InternationalTVC.h"


#define TAG_HISTOIRE 1
#define TAG_DIRECTION 2
#define TAG_RECHERCHE 3
#define TAG_CHIFFRESCLES 4
#define TAG_VALEURS 5
#define TAG_CARRIERES 6
#define TAG_ANCIENS 7
#define TAG_RESEAUX 8
#define TAG_INTERNATIONAL 9


@implementation SurLaMine

#pragma mark -
#pragma mark View lifecycle



- (IBAction) showNextView:(id)sender {
	
	UIButton *bouton = (UIButton *)sender;
	UIViewController *vc = [[UIViewController alloc] init];
	
	switch (bouton.tag) { // On regarde quel bouton a envoyé l'action
		case TAG_HISTOIRE:
			NSLog(@"Histoire");
			HTMLViewController *htmlVCHistoire = [[HTMLViewController alloc] initWithHTMLfilename:@"histoire"];
			htmlVCHistoire.title = @"Historique";
			[self.navigationController pushViewController:htmlVCHistoire animated:YES];
			[htmlVCHistoire release];
			break;
		case TAG_DIRECTION:
			NSLog(@"Direction");
			LaDirectionTVC *dtvc = [[LaDirectionTVC alloc] initWithStyle:UITableViewStyleGrouped];
			dtvc.title = @"La Direction";
			[self.navigationController pushViewController:dtvc animated:YES];
			[dtvc release];
			break;
		case TAG_RECHERCHE:
			NSLog(@"Centres de Recherche");
			RechercheTVC *rechtvc = [[RechercheTVC alloc] initWithStyle:UITableViewStyleGrouped];
			rechtvc.title = @"Centres de Recherche";
			[self.navigationController pushViewController:rechtvc animated:YES];
			[rechtvc release];
			break;
		case TAG_CHIFFRESCLES:
			NSLog(@"Chiffres clés");
			ChiffresCles *cctvc = [[ChiffresCles alloc] initWithStyle:UITableViewStyleGrouped];
			cctvc.title = @"Chiffres-clés";
			[self.navigationController pushViewController:cctvc animated:YES];
			[cctvc release];
			break;
		case TAG_VALEURS:
			NSLog(@"Valeurs");
			HTMLViewController *htmlVCValeurs = [[HTMLViewController alloc] initWithHTMLfilename:@"valeurs"];
			htmlVCValeurs.title = @"Nos valeurs";
			[self.navigationController pushViewController:htmlVCValeurs animated:YES];
			[htmlVCValeurs release];
			break;
		case TAG_CARRIERES:
			NSLog(@"Carrieres");
			CarrieresTVC *ctvc = [[CarrieresTVC alloc] initWithStyle:UITableViewStyleGrouped];
			ctvc.title = @"Carrières possibles";
			[self.navigationController pushViewController:ctvc animated:YES];
			[ctvc release];
			break;
		case TAG_ANCIENS:
			NSLog(@"Anciens");
			HTMLViewController *htmlVCAnciens = [[HTMLViewController alloc] initWithHTMLfilename:@"anciens"];
			htmlVCAnciens.title = @"Les Anciens";
			[self.navigationController pushViewController:htmlVCAnciens animated:YES];
			[htmlVCAnciens release];
			break;
		case TAG_RESEAUX:
			NSLog(@"Reseaux");
			ReseauxTableViewController *rtvc = [[ReseauxTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
			rtvc.title = @"Les Réseaux";
			[self.navigationController pushViewController:rtvc animated:YES];
			[rtvc release];
			break;
		case TAG_INTERNATIONAL:
			NSLog(@"International");
			InternationalTVC *itvc = [[InternationalTVC alloc] initWithStyle:UITableViewStyleGrouped];
			itvc.title = @"International";
			[self.navigationController pushViewController:itvc animated:YES];
			[itvc release];
			
			break;
		default:
			break;
	}
	
	[vc release];
	
}


- (void)viewDidLoad {
	
	// Redéfinition du bouton Retour pour une meilleure lisibilité (plus court)
	
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"La Mine" style:UIBarButtonItemStyleBordered target:self action:nil];
	self.navigationItem.backBarButtonItem = backButton;
	[backButton release];
	
	//
	self.title = @"Sur La Mine";
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
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (NSString *)recupererChaine:(int)nombre avecIdentifiant:(NSString *)key etArgument:(int)argument {
 return @"coucou";	
}

#pragma mark -
#pragma mark Table view data source

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

