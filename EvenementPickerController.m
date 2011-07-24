//
//  EvenementPickerController.m
//  iMines-1
//
//  Created by François de la Taste on 04/02/11.
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
