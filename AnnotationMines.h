//
//  AnnotationMines.h
//  iMines-1
//
//  Created by François de la Taste on 29/07/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AnnotationMines : NSObject <MKAnnotation> {
	
	CLLocationDegrees  latitude;
	CLLocationDegrees  longitude;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property CLLocationDegrees latitude;
@property CLLocationDegrees longitude;

- (NSString *) title;
- (NSString *) subtitle;
@end

