//
//  DirectionZoomVC.h
//  iMines-1
//
//  Created by François de la Taste on 19/09/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DirectionZoomVC : UIViewController {

	IBOutlet UITextView *nom;
	IBOutlet UITextView *email;
	IBOutlet UITextView *tel;
	IBOutlet UITextView *fax;
	NSDictionary *infos;
}

@property (nonatomic, retain) IBOutlet UITextView *nom;
@property (nonatomic, retain) IBOutlet UITextView *email;
@property (nonatomic, retain) IBOutlet UITextView *tel;
@property (nonatomic, retain) IBOutlet UITextView *fax;
@property (nonatomic, retain) NSDictionary *infos;
- (id)initWithInfos:(NSDictionary *)tabInfos;


@end
