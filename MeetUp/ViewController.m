//
//  ViewController.m
//  MeetUp
//
//  Created by Stephen Compton on 1/20/14.
//  Copyright (c) 2014 Stephen Compton. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"


@interface ViewController ()  <UITableViewDelegate, UITableViewDataSource>



{
    __weak IBOutlet UITableView *meetUpTableView;
    
    
    NSDictionary * responseDictionary;
    NSDictionary * meetupDictionary;
    NSArray *responseArray;
    
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL* url = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=354443304d3b501b20150d1b683f25"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
         
         responseArray = [responseDictionary valueForKey:@"results"];
         
         [meetUpTableView reloadData];
         
     }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return responseArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MeetUpCell"];

    NSDictionary * event = responseArray[indexPath.row];
    NSDictionary * venue = responseArray[indexPath.row];
    cell.textLabel.text = [event objectForKey:@"name"];
        cell.detailTextLabel.text = [[venue valueForKey:@"venue" ] valueForKey: @"address_1"];
    
    return cell;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    DetailViewController *dvc = segue.destinationViewController;
    NSIndexPath * indexPath = [meetUpTableView indexPathForCell:sender];
    dvc.event = responseArray[indexPath.row];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end




