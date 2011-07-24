//
//  AnnotationMines.m
//  iMines-1
//
//  Created by François de la Taste on 29/07/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//
#import "AnnotationMines.h"

@implementation AnnotationMines

@synthesize latitude;
@synthesize longitude;
- (id) initWithLatitude:(CLLocationDegrees) lat longitude:(CLLocationDegrees) lng {
	latitude = lat;
	longitude = lng;
	return self;
}
- (CLLocationCoordinate2D) coordinate {
	CLLocationCoordinate2D coord = {self.latitude, self.longitude};
	return coord;
}
- (NSString *) title {
	return @"Mines ParisTech";
}
- (NSString *) subtitle {
	return @"60, bd St Michel 75005";
}
@end
