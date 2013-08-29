//
//  ViewController.m
//  Derp
//
//  Created by Patrick Slattery on 8/28/13.
//  Copyright (c) 2013 Patrick Slattery. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.myQuotes = @[
						@"Live and let live",
						@"Don't cry over spilt milk",
						@"Always look on the bright side of life",
						@"Nobody's perfect",
						@"Can't see the woods for the trees",
						@"Better to have loved and lost than not loved at all",
						@"The early bird catches the worm",
						@"As slow as a wet week"
						];

	NSString *plistCatPath = [
		[NSBundle mainBundle]
		pathForResource:@"quotes"
				 ofType:@"plist"
	];
    self.movieQuotes = [NSMutableArray arrayWithContentsOfFile:plistCatPath];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)quoteButtonTapped:(id)sender {
	NSString *selectedCategory = nil;

	if (self.quoteOpt.selectedSegmentIndex == 0) {
		selectedCategory = @"modern";
	} else if (self.quoteOpt.selectedSegmentIndex == 1) {
		selectedCategory = @"classic";
	} else {
		selectedCategory = @"self";
	}
	
	NSPredicate *predicate = [
		NSPredicate predicateWithFormat:@"category == %@",
		selectedCategory
	];

	NSArray *filteredArray = [self.movieQuotes filteredArrayUsingPredicate:predicate];
	int array_count = [filteredArray count];

	if (array_count > 0) {
		int index = (arc4random() % array_count);
		NSString *quote = filteredArray[index][@"quote"];
		NSString *source = [filteredArray[index] valueForKey:@"source"];
		if (![source length] == 0) {
			quote = [NSString stringWithFormat:@"%@\n\n(%@)", quote, source];
		}

		if ([selectedCategory isEqualToString:@"classic"]) {
			quote = [NSString stringWithFormat:@"From Classic Movie\n\n%@", quote];
		} else if ([selectedCategory isEqualToString:@"modern"]) {
			quote = [NSString stringWithFormat:@"Movie Quote:\n\n%@", quote];
		} else {
			if ([source hasPrefix: @"Harry"]){
				quote = [NSString stringWithFormat:@"Harry Sucks!!\n\n%@", quote];
			}
			quote = [NSString stringWithFormat:@"My Quote:\n\n%@", quote];
		}
		self.quoteText.text = quote;
	} else {
		self.quoteText.text = [NSString stringWithFormat:@"No quotes to display."];
	}
}
@end
