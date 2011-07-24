//
//  PlanContactVC.m
//  iMines-1
//
//  Created by François de la Taste on 29/07/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

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
