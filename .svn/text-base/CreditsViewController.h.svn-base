//
//  CreditsViewController.h
//  iMines-1
//
//  Created by François de la Taste on 16/07/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CreditsViewControllerDelegate;

@interface CreditsViewController : UIViewController {
	
	
	id<CreditsViewControllerDelegate> delegate;

}

@property (assign) id<CreditsViewControllerDelegate> delegate;

- (IBAction) dismissCredits;

@end

@protocol CreditsViewControllerDelegate <NSObject>

- (void) dismissCreditsIsAsked;

@end