//
//  PublicAccueilViewController.h
//  iMines-1
//
//  Created by François de la Taste on 14/07/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#define TAG_SGS 1
#define TAG_EMPLOIDUTEMPS 2
#define TAG_VDM 5
#define TAG_VENDOME 6
#define TAG_TROMBI 7
#define TAG_ASSOS 8
#define TAG_PETITSCOURS 9
#define TAG_PATRIMOINE 10
#define TAG_CARRIERES 14
#define TAG_INTERNATIONAL 15
#define TAG_DIRECTION 16
#define TAG_RESEAUX 17
#define TAG_ACTUALITES 4
#define TAG_AUJOURDHUI 11
#define TAG_PLAN 12
#define TAG_ENTRERAUXMINES 13
#define TAG_VIEDESELEVES 3
#define TAG_AGENDA 18

#import "CreditsViewController.h";

@interface PublicAccueilViewController : UIViewController <CreditsViewControllerDelegate, UIScrollViewDelegate> {

	IBOutlet UIScrollView *scrollView;
	IBOutlet UIPageControl *pageControl;
	Boolean pageControlUsed;
	
}

@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIPageControl	*pageControl;

- (IBAction)changePage:(id)sender;
-(IBAction)showNextView:(id)sender;
-(IBAction)showCredits;
@end
