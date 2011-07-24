//
//  PlanContactVC.h
//  iMines-1
//
//  Created by François de la Taste on 29/07/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface PlanContactVC : UIViewController {
	
	IBOutlet MKMapView *mapView;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end
