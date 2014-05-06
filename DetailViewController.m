//
//  DetailViewController.m
//  MeetUp
//
//  Created by Stephen Compton on 1/20/14.
//  Copyright (c) 2014 Stephen Compton. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

{
    __weak IBOutlet UINavigationItem *navBarTitle;
    __weak IBOutlet UILabel *rsvpLabel;
    __weak IBOutlet UILabel *groupNameLabel;
    __weak IBOutlet UILabel *forWhomLabel;
    __weak IBOutlet UITextView *descriptionTextFieldLabel;
    __weak IBOutlet UIButton *detailLinkButton;
    
    NSString *urlForWebView;
}

@end

@implementation DetailViewController
@synthesize event;

/*- (IBAction)onURLPressed:(id)sender {
    
NSURL * webpage = [NSURL alloc]initWithString:urlLabel.text];
UIApplication *app = [UIApplication sharedApplication];
[app openURL:webpage];
}*/

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = [NSString stringWithFormat:@"%@", event[@"yes_rsvp_count"]];
    rsvpLabel.text = [NSString stringWithFormat:@"%@", event[@"maybe_rsvp_count"]];
    groupNameLabel.text = event[@"group"][@"name"];
    forWhomLabel.text = event[@"group"][@"who"];
    
    descriptionTextFieldLabel.text = event[@"description"];

    if([event[@"event_url"] isEqualToString:@""])
    {
        detailLinkButton.alpha = 0;
    } else {
        detailLinkButton.alpha = 1;
        urlForWebView = event[@"event_url"];
    }
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
