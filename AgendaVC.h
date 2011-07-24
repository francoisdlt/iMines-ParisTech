//
//  AgendaVC.h
//  iMines-1
//
//  Created by François de la Taste on 04/02/11.
//  Copyright 2011 Mines ParisTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EvenementPickerController.h"

@interface AgendaVC : UIViewController {
	
	IBOutlet EvenementPickerController *pickerController;

}

@property (nonatomic, retain) IBOutlet EvenementPickerController *pickerController;

@end
