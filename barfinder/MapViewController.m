//
//  MapViewController.m
//  barfinder
//
//  Created by Jonathan Clark on 2/21/2014.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import "MapViewController.h"

#import "Venue.h"
#import "VenueAnnotation.h"
#import "BarInfoViewController.h"

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
        VenueAnnotation *bar = [[VenueAnnotation alloc] init];
        CLLocationCoordinate2D pinCoordinate;
        pinCoordinate.latitude = [[venue valueForKey:@"lat"] floatValue];
        pinCoordinate.longitude = [[venue valueForKey:@"lng"] floatValue];
        bar.coordinate = pinCoordinate;
        bar.title = [venue valueForKey:@"name"];
        bar.subtitle = [NSString stringWithFormat:@"%@ - %@", [venue valueForKey:@"type"], [venue valueForKey:@"address"]];
        bar.venueid = [venue valueForKey:@"venueid"];
        [self.mapView addAnnotation:bar];
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView2 viewForAnnotation:(id <MKAnnotation>)annotation {
    
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    if ([annotation isKindOfClass:[VenueAnnotation class]])
    {
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView2 dequeueReusableAnnotationViewWithIdentifier:@"String"];
        if(!annotationView) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"String"];
            annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        }
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        return annotationView;
    }
    return nil;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    VenueAnnotation *venue = (VenueAnnotation*)[view annotation];
    [self performSegueWithIdentifier:@"viewVenueInfo" sender:venue];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"viewVenueInfo"])
    {
        VenueAnnotation *venue = (VenueAnnotation*)sender;
        BarInfoViewController *vc = [segue destinationViewController];
        vc.venueid = venue.venueid;
    }
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
