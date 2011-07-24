//
//  DirectionZoomVC.m
//  iMines-1
//
//  Created by François de la Taste on 19/09/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

#import "DirectionZoomVC.h"


@implementation DirectionZoomVC
@synthesize nom, tel, email, fax, infos;

- (id)initWithInfos:(NSDictionary *)tabInfos {
	NSLog(@"Received : %@", [[tabInfos objectForKey:@"contenu"] objectForKey:@"nom"]);
	infos = tabInfos;
	return [super init];
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
    [super viewDidLoad];
	nom.text = [[infos objectForKey:@"contenu"] objectForKey:@"nom"];
	email.text = [[infos objectForKey:@"contenu"] objectForKey:@"email"];
	tel.text = [[infos objectForKey:@"contenu"] objectForKey:@"tel"];
	fax.text = [[infos objectForKey:@"contenu"] objectForKey:@"fax"];
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
