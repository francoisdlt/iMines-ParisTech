//
//  PlanContactVC.m
//  iMines-1
//
//  Created by François de la Taste on 29/07/10.
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

#import "PlanContactVC.h"
#import <MapKit/MapKit.h>
#import "AnnotationMines.h"

#define LATITUDE_MINES 48.845916
#define LONGITUDE_MINES 2.339766

@implementation PlanContactVC
@synthesize mapView;

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
	
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	// span à modifier selon l'étendue désirée de la carte
	span.latitudeDelta=0.05;
	span.longitudeDelta=0.05;
	
	CLLocationCoordinate2D location=mapView.userLocation.coordinate;
	
	location.latitude=LATITUDE_MINES;
	location.longitude=LONGITUDE_MINES;
	region.span=span;
	region.center=location;
	
	[mapView setRegion:region animated:TRUE];
	AnnotationMines *annotation = [[[AnnotationMines alloc] initWithLatitude:LATITUDE_MINES longitude:LONGITUDE_MINES] autorelease];
	[mapView addAnnotation:annotation];
    [super viewDidLoad];
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
