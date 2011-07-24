//
//  EleveWrapper.h
//  iMines-1
//
//  Created by François de la Taste on 19/12/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EleveWrapper : NSObject <NSCopying>{

	NSString *eleveID;
	NSString *nom;
	NSString *prenom;
}

@property (nonatomic, copy) NSString *eleveID;
@property (nonatomic, copy) NSString *nom;
@property (nonatomic, copy) NSString *prenom;

- (id)initWithID:(NSString *)currentID nom:(NSString *)currentNom prenom:(NSString *)currentPrenom;
@end
