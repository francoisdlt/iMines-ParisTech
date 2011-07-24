//
//  EmploiDuTempsTVC.h
//  iMines-1
//
//  Created by François de la Taste on 31/08/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"

@interface EmploiDuTempsTVC : UITableViewController <ASIHTTPRequestDelegate> {
	
	NSMutableArray *emploisDuTemps;
	IBOutlet UITableView *myTableView;
	UIActivityIndicatorView *actIndCell;
	//NSIndexPath *currentIndexPath;

}
- (NSString *)getCurrentAnnee;
@property (nonatomic, retain) NSMutableArray *emploisDuTemps;
@property (nonatomic, retain) IBOutlet UITableView *myTableView;
//@property (nonatomic, retain) NSIndexPath *currentIndexPath;
@end
