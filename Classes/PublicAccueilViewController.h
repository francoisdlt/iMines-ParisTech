//
//  PublicAccueilViewController.h
//  iMines-1
//
//  Created by François de la Taste on 14/07/10.
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
