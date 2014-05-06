//
//  DetailViewController.h
//  MeetUp
//
//  Created by Stephen Compton on 1/20/14.
//  Copyright (c) 2014 Stephen Compton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController


@property NSDictionary *event;

@property NSString *name;
@property NSString *rsvpCounts;
@property NSString *hostInformation;
@property NSString *description;
@property NSString *url;
@property NSString *forWhom;
@property NSString *groupName;

@end
