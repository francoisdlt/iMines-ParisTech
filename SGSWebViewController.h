//
//  SGSWebViewController.h
//  iMines-1
//
//  Created by François de la Taste on 18/12/10.
//  Copyright 2010 Mines ParisTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"

@interface SGSWebViewController : UIViewController <ASIHTTPRequestDelegate> {
	
	IBOutlet UIWebView *webView;
	
}
@property (nonatomic, retain) IBOutlet UIWebView *webView;

@end
