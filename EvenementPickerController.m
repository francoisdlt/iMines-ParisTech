//
//  EvenementPickerController.m
//  iMines-1
//
//  Created by François de la Taste on 04/02/11.
//  Copyright 2011 Mines ParisTech. All rights reserved.
//

#import "EvenementPickerController.h"
#import <QuartzCore/QuartzCore.h>

@implementation EvenementPickerController
@synthesize pickerView,textView, imageView, dateLabel;


- (id)init{
	//NSLog(@"init picker !!!");
	NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Agenda" ofType:@"plist"];
	//NSLog(@"plistPath : %@", plistPath);
	listeEvenements = [[NSArray alloc] initWithContentsOfFile:plistPath];
	//NSLog(@"liste : %@",[listeEvenements description]);

	return [super init];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	
	return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	
	return [listeEvenements count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	
	return [[listeEvenements objectAtIndex:row] objectForKey:@"nom"];
	
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	// If the user chooses a new row, update the label accordingly.
	//NSLog(@"Row selectionnée : %d", row);
	textView.text = [[listeEvenements objectAtIndex:row] objectForKey:@"description"];
	dateLabel.text = [[listeEvenements objectAtIndex:row] objectForKey:@"date"]; 
	imageView.image = [UIImage imageNamed:[[listeEvenements objectAtIndex:row] objectForKey:@"image"]];
	imageView.layer.cornerRadius = 5.0;
    imageView.layer.masksToBounds = YES;
    imageView.layer.borderColor = [UIColor blackColor].CGColor;
    imageView.layer.borderWidth = 1.0;
}

@end
