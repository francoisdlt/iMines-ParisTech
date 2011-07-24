//
//  AujourdhuiVC.m
//  iMines-1
//
//  Created by François de la Taste on 06/02/11.
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

#import "AujourdhuiVC.h"
#import "HTMLViewController.h"
#import "RechercheTVC.h"
#import "PresseTVC.h"
#import "ChiffresCles.h"

@implementation AujourdhuiVC

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

-(IBAction) showNextView:(id)sender {
	
	UIButton *button = (UIButton*)sender;
	switch(button.tag){
		case TAG_RECHERCHE:
			NSLog(@"La Recherche");
			RechercheTVC *rtvc = [[RechercheTVC alloc] initWithStyle:UITableViewStyleGrouped];
			rtvc.title = @"La Recherche";
			[self.navigationController pushViewController:rtvc animated:YES];
			[rtvc release];
			break;
		case TAG_CLASSEMENTS:
			NSLog(@"Classements");
			HTMLViewController *cvc = [[HTMLViewController alloc] initWithHTMLfilename:@"classements"];
			cvc.title = @"Classements";
			[self.navigationController pushViewController:cvc animated:YES];
			[cvc release];
			break;
		case TAG_PRESSE:
			NSLog(@"Communiques de presse");
			PresseTVC *ptvc = [[PresseTVC alloc] initWithStyle:UITableViewStylePlain];
			ptvc.title = @"Communiqués";
			[self.navigationController pushViewController:ptvc animated:YES];
			[ptvc release];
			break;
		case TAG_CHIFFRESCLES:
			NSLog(@"Chiffres clés");
			ChiffresCles *ccvc = [[ChiffresCles alloc] initWithStyle:UITableViewStyleGrouped];
			ccvc.title = @"Chiffres-clés";
			[self.navigationController pushViewController:ccvc animated:YES];
			[ccvc release];
			break;
		default:
			break;
	}
	
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
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
