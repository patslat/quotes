//
//  ViewController.h
//  Derp
//
//  Created by Patrick Slattery on 8/28/13.
//  Copyright (c) 2013 Patrick Slattery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
	@property (nonatomic, strong) NSArray *myQuotes;
	@property (nonatomic, strong) NSMutableArray *movieQuotes;
	@property (nonatomic, strong) IBOutlet UITextView *quoteText;
	@property (nonatomic, strong) IBOutlet UISegmentedControl *quoteOpt;

	- (IBAction)quoteButtonTapped:(id)sender;
@end
