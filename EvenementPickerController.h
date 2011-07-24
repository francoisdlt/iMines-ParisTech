//
//  EvenementPickerController.h
//  iMines-1
//
//  Created by François de la Taste on 04/02/11.
//  Copyright 2011 Mines ParisTech. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EvenementPickerController : NSObject <UIPickerViewDataSource, UIPickerViewDelegate> {

	IBOutlet UIPickerView *pickerView;
	IBOutlet UIImageView *imageView;
	IBOutlet UITextView *textView;
	IBOutlet UILabel *dateLabel;
	NSArray *listeEvenements;
}
@property (nonatomic, retain) IBOutlet UIPickerView *pickerView;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UITextView *textView;
@property (nonatomic, retain) IBOutlet UILabel *dateLabel;

@end
