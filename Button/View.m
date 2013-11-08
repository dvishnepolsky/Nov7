//
//  View.m
//  Button
//
//  Created by Dimitri Vishnepolsky on 11/07/13.
//  Copyright (c) dv. All rights reserved.
//

#import "View.h"
#import "ButtonAppDelegate.h"	//so we can mention touchUpInside:

@implementation View

- (void) valueChanged
{
	textView.text = [dateFormatter stringFromDate: datePicker.date];
}


- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
		button = [UIButton buttonWithType: UIButtonTypeRoundedRect];

		//Center the button in the view.
		CGRect b = self.bounds;
		CGSize s = CGSizeMake(200, 40);	//size of button

		button.frame = CGRectMake(
			b.origin.x + (b.size.width - s.width) / 2,
			b.origin.y + (b.size.height - s.height) / 2,
			s.width,
			s.height
		);

		button.backgroundColor = [UIColor yellowColor];
		[button setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
		//[button setTitle: @"Chinese sound effect" forState: UIControlStateNormal];
        ;
        UIImage * buttonImage = [UIImage imageNamed:@"bullet.png"];
        [button setImage:buttonImage forState:UIControlStateNormal];

		[button addTarget: [UIApplication sharedApplication].delegate
			action: @selector(touchUpInside:)
			forControlEvents: UIControlEventTouchUpInside
		];

		[self addSubview: button];
        
        
        // Initialization code
		self.backgroundColor = [UIColor greenColor];
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateStyle: NSDateFormatterMediumStyle];
		[dateFormatter setTimeStyle: NSDateFormatterFullStyle];
        
		//Let the date picker assume its natural size.
		datePicker = [[UIDatePicker alloc] initWithFrame: CGRectZero];
		datePicker.datePickerMode = UIDatePickerModeTime; //vs. UIDatePickerModeTime

        
		datePicker.frame = CGRectMake(
                                      b.origin.x,
                                      b.origin.y,
                                      0,
                                      0
                                      );
        
		[datePicker addTarget: self
                       action: @selector(valueChanged)
             forControlEvents: UIControlEventValueChanged
         ];
        
		[self addSubview: datePicker];
        
        
        
		CGRect f = CGRectMake(
                              b.origin.x,
                              b.origin.y + datePicker.bounds.size.height + 100,
                              b.size.width,
                              b.size.height - datePicker.bounds.size.height
                              );
        
		textView = [[UITextView alloc] initWithFrame: f];
		textView.editable = NO;
		textView.font = [UIFont systemFontOfSize: 32
                         ];
		[self valueChanged];
		[self addSubview: textView];
        
	}

	return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
	// Drawing code
}
*/

@end
