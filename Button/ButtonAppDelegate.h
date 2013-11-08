//
//  ButtonAppDelegate.h
//  Button
//
//  Created by Dimitri Vishnepolsky on 11/07/13.
//  Copyright (c) dv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>	//needed for SystemSoundID
@class View;
@class ViewSlider;

@interface ButtonAppDelegate: UIResponder <UIApplicationDelegate> {
	View *view;
    ViewSlider *viewSlider;
	SystemSoundID sid;
}

- (void) touchUpInside: (id) sender;
@property (strong, nonatomic) UIWindow *window;
@end
