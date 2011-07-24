//
//  InscriptionPetitCoursVC.m
//  iMines-1
//
//  Created by François de la Taste on 12/09/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

#import "InscriptionPetitCoursVC.h"
#import "ASIFormDataRequest.h"


@implementation InscriptionPetitCoursVC
@synthesize nomPC, matierePC, adressePC, niveauPC, commentairePC, selectedPetitCours;
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
 // Custom initialization
 }
 return self;
 }
 */



- (id)initWithPetitCours:(NSMutableDictionary *)pc {
	selectedPetitCours = pc;
	NSLog(@"Received PC : %@", [selectedPetitCours objectForKey:@"nom"]);
	return [super init];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	nomPC.text = [selectedPetitCours objectForKey:@"nom"];
	matierePC.text = [selectedPetitCours objectForKey:@"matiere"];
	niveauPC.text = [selectedPetitCours objectForKey:@"niveau"];
	commentairePC.text = [selectedPetitCours objectForKey:@"commentaire"];
	adressePC.text = [selectedPetitCours objectForKey:@"adresse"];
    [super viewDidLoad];
}


- (IBAction)sIncrirePressed {
	
	
	UIActionSheet *actionSheet = [UIActionSheet alloc];
	[actionSheet initWithTitle:@"S'inscrire pour ce petit cours ?" delegate:self cancelButtonTitle:@"Annuler" destructiveButtonTitle:@"Je m'inscris" otherButtonTitles:nil];
	//[actionSheet showFromTabBar:self.tabBarController.tabBar];
	[actionSheet showInView:self.view];
	
}

- (void)actionSheet:(UIActionSheet  *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	NSLog(@"button index : %d",buttonIndex);
	if(buttonIndex==0){
		
		NSLog(@"je veux m'inscrire !");
		
		// Vérification de l'existence d'une identité :
		NSUserDefaults *defaultSettings = [NSUserDefaults standardUserDefaults];
		NSString *userLogin = [defaultSettings stringForKey:@"login_ccsi"];
		NSLog(@"User : %@", userLogin);
		if ([userLogin length]==0) {
			
			NSLog(@"userLogin vide !");
			UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Erreur :" message:@"Votre login n'est pas renseigné!\nVoir Préférences iMines" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[errorAlert show];
            [errorAlert release];
			
		}
		else {
			NSLog(@"Formulaire bien rempli");
			// Construction email et promo
			NSString *email = [userLogin stringByAppendingFormat:@"@ensmp.fr"];
			NSString *promo = [userLogin stringByPaddingToLength:2 withString:@"0" startingAtIndex:0];
			//NSLog(@"email : %@ // promo : %@", email, promo);
			// Construction de la requête
			NSURL *urlPC = [[NSURL alloc] initWithString:@"http://www.monbde.eu/petitscours/iMines/InscriptionPC.php"];
			ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:urlPC];
			[urlPC release];
			[request setPostValue:userLogin forKey:@"nom"];
			[request setPostValue:userLogin forKey:@"prenom"];
			[request setPostValue:promo forKey:@"annee"];
			[request setPostValue:email forKey:@"email"];
			[request setPostValue:[selectedPetitCours objectForKey:@"id"] forKey:@"id"];
			[request start];
			NSError *error = [request error];
			if (!error) {
				NSLog(@"Pas d'erreur !");
				NSString *response = [request responseString];
				NSLog(@"Reponse : %@", response);
				UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Demande enregistrée !" message:@"Merci et à bientôt..." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
				[errorAlert show];
				[errorAlert release];
				[self.navigationController popViewControllerAnimated:YES];
			}
			else {
				UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Erreur :" message:@"Impossible d'envoyer la requête" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
				[errorAlert show];
				[errorAlert release];
			}
			
			
		}
	}
	
}




/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

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
