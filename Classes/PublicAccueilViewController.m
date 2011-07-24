//
//  PublicAccueilViewController.m
//  iMines-1
//
//  Created by François de la Taste on 14/07/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

#import "PublicAccueilViewController.h"
#import "CreditsViewController.h"
#import "PlanContactVC.h"
#import "IntegrerTVC.h"
#import "StandardWebView.h"
#import "VieDesElevesVC.h"
#import "HTMLViewController.h"
#import "VDMViewController.h"
#import "VendomeViewController.h"
#import "TrombiTVC.h"
#import "EmploiDuTempsTVC.h"
#import "SGSWebViewController.h"
#import "AssosTVC.h"
#import "PetitsCoursTVC.h"
#import "LaDirectionTVC.h"
#import "CarrieresTVC.h"
#import "ReseauxTableViewController.h"
#import "InternationalTVC.h"
#import "AgendaVC.h"
#import "PatrimoineVC.h"
#import "AujourdhuiVC.h"

@implementation PublicAccueilViewController

static int kNbPages = 2;

@synthesize scrollView, pageControl;

-(IBAction)showNextView:(id)sender {
	
	UIButton *bouton = (UIButton *)sender;
	NSLog(@"Bouton tag : %d", bouton.tag);
	UIViewController *vc = [[UIViewController alloc] init];
	
	// on regarde quel bouton a envoyé l'action (voir header pour les constantes)

	switch (bouton.tag) { 
		case TAG_ACTUALITES:
			NSLog(@"Actualités");
			NSString *urlString = @"http://twitter.com/MINES_ParisTech/";
			
			StandardWebView *detailViewController = [[StandardWebView alloc] initWithURLString:urlString];
			detailViewController.title = @"Twitter";
			// Pass the selected object to the new view controller.
			[self.navigationController pushViewController:detailViewController animated:YES];
			[detailViewController release];
			break;
		case TAG_AUJOURDHUI:
			NSLog(@"L'école aujourd'hui");
			AujourdhuiVC *aujvc = [[AujourdhuiVC alloc] init];
			aujvc.title = @"Aujourd'hui";
			[self.navigationController pushViewController:aujvc animated:YES];
			[aujvc release];
			break;
		case TAG_PLAN:
			NSLog(@"Plan");
			PlanContactVC *pcvc = [[PlanContactVC alloc] init];
			pcvc.title = @"Plan de situation";
			[self.navigationController pushViewController:pcvc animated:YES];
			[pcvc release];
			break;
		case TAG_ENTRERAUXMINES:
			NSLog(@"Entrer aux Mines");
			IntegrerTVC *integrertvc = [[IntegrerTVC alloc] initWithStyle:UITableViewStyleGrouped];
			integrertvc.title = @"Integrer";
			[self.navigationController pushViewController:integrertvc animated:YES];
			[integrertvc release];
			break;
		case TAG_VIEDESELEVES:
			NSLog(@"Vie des élèves");
			VieDesElevesVC *vetvc = [[VieDesElevesVC alloc] init];
			vetvc.title = @"Vie des Elèves";
			[self.navigationController pushViewController:vetvc animated:YES];
			[vetvc release];
			break;
		case TAG_AGENDA:
			NSLog(@"Agenda");
			/*vc.title = @"Agenda";
			[self.navigationController pushViewController:vc animated:YES];
			 */
			/*
			UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Bientôt..." message:@"L'agenda sera disponible dans une future version de l'application." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[errorAlert show];
			[errorAlert release];
			 */
			/*HTMLViewController *agendaVC = [[HTMLViewController alloc] initWithHTMLfilename:@"agenda"];
			agendaVC.title = @"Grands évènements";
			[self.navigationController pushViewController:agendaVC animated:YES];
			[agendaVC release];
			 */
			AgendaVC *agendaVC = [[AgendaVC alloc] init];
			agendaVC.title = @"Agenda";
			[self.navigationController pushViewController:agendaVC animated:YES];
			[agendaVC release];
			break;
		case TAG_VDM:
			NSLog(@"VDM");
			VDMViewController *vdmvc = [[VDMViewController alloc] init];
			vdmvc.title = @"VieDeMineur";
			[self.navigationController pushViewController:vdmvc animated:YES];
			[vdmvc release];
			break;
		case TAG_VENDOME:
			NSLog(@"VENDOME");
			VendomeViewController *vvc = [[VendomeViewController alloc] init];
			vvc.title = @"Le Vendôme";
			[self.navigationController pushViewController:vvc animated:YES];	
			[vvc release];
			break;
		case TAG_TROMBI:
			NSLog(@"TROMBI");
			TrombiTVC *ttvc = [[TrombiTVC alloc] init];
			ttvc.title = @"Le Trombi";
			[self.navigationController pushViewController:ttvc animated:YES];
			[ttvc release];
			break;
		case TAG_EMPLOIDUTEMPS:
			NSLog(@"EMPLOI DU TEMPS");
			EmploiDuTempsTVC *edttvc = [[EmploiDuTempsTVC alloc] initWithStyle:UITableViewStyleGrouped];
			edttvc.title = @"Les emplois du temps";
			[self.navigationController pushViewController:edttvc animated:YES];
			[edttvc release];
			break;
		case TAG_SGS:
			NSLog(@"SGS");
			SGSWebViewController *sgsVC = [[SGSWebViewController alloc] init];
			sgsVC.title = @"SGS";
			[self.navigationController pushViewController:sgsVC animated:YES];
			[sgsVC release];
			break;
		case TAG_ASSOS:
			NSLog(@"ASSOS");
			AssosTVC *atvc = [[AssosTVC alloc] init];
			atvc.title = @"Les Associations";
			[self.navigationController pushViewController:atvc animated:YES];
			[atvc release];
			break;
		case TAG_PETITSCOURS:
			NSLog(@"PETITS COURS");
			PetitsCoursTVC *pctvc = [[PetitsCoursTVC alloc] initWithStyle:UITableViewStyleGrouped];
			pctvc.title = @"Les Petits Cours";
			[self.navigationController pushViewController:pctvc animated:YES];
			[pctvc release];
			break;
		case TAG_PATRIMOINE:
			NSLog(@"Patrimoine");
			PatrimoineVC *patVC = [[PatrimoineVC alloc] init];
			patVC.title = @"Patrimoine";
			[self.navigationController pushViewController:patVC animated:YES];
			[patVC release];
			break;
		case TAG_DIRECTION:
			NSLog(@"Direction");
			LaDirectionTVC *dtvc = [[LaDirectionTVC alloc] initWithStyle:UITableViewStyleGrouped];
			dtvc.title = @"La Direction";
			[self.navigationController pushViewController:dtvc animated:YES];
			[dtvc release];
			break;
		case TAG_CARRIERES:
			NSLog(@"Carrieres");
			CarrieresTVC *ctvc = [[CarrieresTVC alloc] initWithStyle:UITableViewStyleGrouped];
			ctvc.title = @"Carrières possibles";
			[self.navigationController pushViewController:ctvc animated:YES];
			[ctvc release];
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
		default:
			break;
	}	
	
	[vc release];
}
// méthode invoquée lors de l'appui sur le bouton Crédits

- (IBAction) showCredits {
	CreditsViewController *creditsViewController = [[CreditsViewController alloc] init];
	creditsViewController.title = @"Crédits";
	creditsViewController.delegate = self; // on se désigne comme delegate pour ensuite dismiss depuis ici (voir méthode dismissCreditsIsAsked)
	[creditsViewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
	[self.navigationController presentModalViewController:creditsViewController animated:YES];
	[creditsViewController release];
	NSLog(@"Voici les crédits");
	
}

- (void) dismissCreditsIsAsked {
	// étant le delegate du modal view controller Credits, c'est à nous de le dismiss
	[self dismissModalViewControllerAnimated:YES];
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
 // Custom initialization
 }
 return self;
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	// on redéfinit le back button
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Accueil" style:UIBarButtonItemStyleBordered target:self action:nil];
	self.navigationItem.backBarButtonItem = backButton;
	[backButton release];
	
	NSLog(@"coucou");
	scrollView.contentSize = CGSizeMake(320*kNbPages, 416);
	scrollView.pagingEnabled = YES;
	scrollView.scrollEnabled = YES;
	scrollView.delegate = self;
	// on ajoute le bouton pour voir les crédits
	UIBarButtonItem *infoButton = [[UIBarButtonItem alloc] initWithTitle:@"Crédits" style:UIBarButtonItemStylePlain target:self action:@selector(showCredits)];
	self.navigationItem.rightBarButtonItem = infoButton;
	[infoButton release];
	
	
	[super viewDidLoad];
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
    if (pageControlUsed)
    {
        // do nothing - the scroll was initiated from the page control, not the user dragging
        return;
    }
    
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
}

// At the begin of scroll dragging, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
}

// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
}

- (IBAction)changePage:(id)sender
{
    int page = pageControl.currentPage;
    
    // update the scroll view to the appropriate page
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
    
    // Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (UIInterfaceOrientationPortrait==interfaceOrientation);
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
