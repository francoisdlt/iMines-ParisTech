//
//  EleveWrapper.m
//  iMines-1
//
//  Created by François de la Taste on 19/12/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

#import "EleveWrapper.h"


@implementation EleveWrapper
@synthesize eleveID, nom, prenom;

-(id)initWithID:(NSString *)currentID nom:(NSString *)currentNom prenom:(NSString *)currentPrenom {
		
	eleveID = currentID;
	nom = currentNom;
	prenom = currentPrenom;
	return [super init];
}

-(id)copyWithZone:(NSZone *)zone {
	
	id result = [[[self class] allocWithZone:zone] init];
	
    [result setNom:nom];
    [result setPrenom:prenom];
	[result setEleveID:eleveID];
	
    return result;
	
}

- (void)dealloc {
	[super dealloc];
	[eleveID release];
	[prenom release];
	[nom release];
	
}
@end
