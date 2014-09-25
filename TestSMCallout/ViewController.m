//
//  ViewController.m
//  TestSMCallout
//
//  Created by Patrick BODET on 24/09/2014.
//  Copyright (c) 2014 Patrick BODET. All rights reserved.
//

#import "SMCalloutView.h"
#import "ViewController.h"

@interface ViewController () {

    UIButton *button;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:@"Pin.png"];
    button.center = self.view.center;
    button.frame = CGRectMake(self.view.center.x - image.size.width / 2, self.view.center.y - image.size.height / 2, image.size.width, image.size.height);
    NSLog(@"Button Frame = %@",NSStringFromCGRect(button.frame));
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(markerClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)markerClicked:(id)sender {
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    contentView.backgroundColor = [UIColor yellowColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, 100, 25)];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"SMCallout Sample";
    [contentView addSubview:label];
    
    SMCalloutView *calloutView = [[SMCalloutView alloc]init];
    calloutView.contentView = contentView;
    
    UIButton *accessoryButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [accessoryButton addTarget:self action:@selector(tapOnCalloutAccessoryControl:) forControlEvents:UIControlEventTouchUpInside];
    calloutView.rightAccessoryView = accessoryButton;
    calloutView.permittedArrowDirection = SMCalloutArrowDirectionAny;
    
    [calloutView presentCalloutFromRect:button.frame inView:self.view constrainedToView:self.view animated:YES];
}

- (void)tapOnCalloutAccessoryControl:(UIControl *)control
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"SMCallout" message:@"AccessoryView clicked" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

@end
