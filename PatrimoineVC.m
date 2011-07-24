//
//  PatrimoineVC.m
//  iMines-1
//
//  Created by François de la Taste on 02/02/11.
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

#import "PatrimoineVC.h"
#import "MuseeVC.h"
#import "HTMLViewController.h"

@implementation PatrimoineVC

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
		case TAG_HISTOIRE:
			NSLog(@"Histoire");
			HTMLViewController *histoireVC = [[HTMLViewController alloc] initWithHTMLfilename:@"histoire"];
			histoireVC.title = @"Histoire";
			[self.navigationController pushViewController:histoireVC animated:YES];
			[histoireVC release];
			break;
		case TAG_MUSEE:
			NSLog(@"musee");
			MuseeVC *museeVC = [[MuseeVC alloc] init];
			museeVC.title = @"Le Musée";
			[self.navigationController pushViewController:museeVC animated:YES];
			[museeVC release];
			break;
		case TAG_BATIMENTS:
			NSLog(@"Batiments");
			HTMLViewController *batimentsVC = [[HTMLViewController alloc] initWithHTMLfilename:@"histoire-batiments"];
			batimentsVC.title = @"Les bâtiments";
			[self.navigationController pushViewController:batimentsVC animated:YES];
			[batimentsVC release];
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
