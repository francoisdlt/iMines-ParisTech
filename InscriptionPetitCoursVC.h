//
//  InscriptionPetitCoursVC.h
//  iMines-1
//
//  Created by François de la Taste on 12/09/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface InscriptionPetitCoursVC : UIViewController <UIActionSheetDelegate>{

	NSMutableDictionary *selectedPetitCours;
	IBOutlet UIScrollView *scrollView;
	IBOutlet UILabel *nomPC;
	IBOutlet UILabel *matierePC;
	IBOutlet UILabel *niveauPC;
	IBOutlet UILabel *adressePC;
	IBOutlet UILabel *commentairePC;
	NSData *responseData;
}

@property (nonatomic, retain) NSMutableDictionary *selectedPetitCours;
@property (nonatomic, retain) IBOutlet UILabel *nomPC;
@property (nonatomic, retain) IBOutlet UILabel *matierePC;
@property (nonatomic, retain) IBOutlet UILabel *niveauPC;
@property (nonatomic, retain) IBOutlet UILabel *adressePC;
@property (nonatomic, retain) IBOutlet UILabel *commentairePC;

- (id)initWithPetitCours:(NSMutableDictionary *)pc;
- (IBAction)sIncrirePressed;
@end
