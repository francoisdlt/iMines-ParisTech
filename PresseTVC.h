//
//  PresseTVC.h
//  iMines-1
//
//  Created by François de la Taste on 27/12/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"

@interface PresseTVC : UITableViewController <ASIHTTPRequestDelegate>{

	NSMutableArray *communiques;
	
}
@end
