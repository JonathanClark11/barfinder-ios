//
//  MapViewController.m
//  barfinder
//
//  Created by Jonathan Clark on 2/21/2014.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import "MapViewController.h"

#import "Venue.h"
#import "BarfinderAPIManager.h"
#import "BarfinderAPICommunicator.h"

@interface MapViewController () <BarfinderAPIManagerDelegate> {
    NSArray *_venues;
    BarfinderAPIManager *_manager;
}

@end

@implementation MapViewController
@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapView.delegate = self;
    
    self.title = @"Venues Near Me";
    
    //ADD ALL BARS
    _manager = [[BarfinderAPIManager alloc] init];
    _manager.communicator = [[BarfinderAPICommunicator alloc] init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    
    [_manager fetchVenues];
    
}

- (void)didReceiveVenues:(NSArray *)venues
{
    _venues = venues;
    //iterate through and add marker for each
    for (id venue in _venues) {
        MKPointAnnotation *bar = [[MKPointAnnotation alloc] init];
        CLLocationCoordinate2D pinCoordinate;
        pinCoordinate.latitude = [[venue valueForKey:@"lat"] floatValue];
        pinCoordinate.longitude = [[venue valueForKey:@"lng"] floatValue];
        bar.coordinate = pinCoordinate;
        bar.title = [venue valueForKey:@"name"];
        bar.subtitle = @"get drunk";
        [self.mapView addAnnotation:bar];
    }
    
    
    //[self.tableView reloadData];
}

- (void)fetchingVenueFailedWithError:(NSError *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
