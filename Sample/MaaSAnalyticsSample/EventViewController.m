//
//  EventViewController.m
//  MaaSAnalyticsSample
//
//  Created by Devin Pigera on 7/12/13.
//  Copyright (c) 2013 Phunware Inc. All rights reserved.
//

#import "EventViewController.h"

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]

@interface EventViewController ()

@property (nonatomic, weak) UISegmentedControl *fruitChoicesControl;
@property (nonatomic, weak) UIButton *stopTimedEventButton;

@end

@implementation EventViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat xCoord = 10;
    CGFloat yCoord = 10;
    CGFloat margin = 10;
    
    CGFloat buttonWidth = self.view.frame.size.width - margin*2;
    CGFloat buttonHeight = 45;
    
    UIButton *redButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [redButton setFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
    [redButton addTarget:self action:@selector(redButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [redButton.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [redButton setTitle:@"Red Event" forState:UIControlStateNormal];
    [redButton setTitleColor:[UIColor colorWithWhite:1 alpha:0.5] forState:UIControlStateHighlighted];
    [redButton setBackgroundColor:RGB(248, 92, 86)];
    [self.view addSubview:redButton];
    
    yCoord += buttonHeight + margin;
    
    UIButton *greenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [greenButton setFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
    [greenButton addTarget:self action:@selector(greenButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [greenButton.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [greenButton setTitle:@"Green Event" forState:UIControlStateNormal];
    [greenButton setTitleColor:[UIColor colorWithWhite:1 alpha:0.5] forState:UIControlStateHighlighted];
    [greenButton setBackgroundColor:RGB(54, 252, 56)];
    [self.view addSubview:greenButton];
    
    yCoord += buttonHeight + margin;
    
    UIButton *blueButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [blueButton setFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
    [blueButton addTarget:self action:@selector(blueButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [blueButton.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [blueButton setTitle:@"Blue Event" forState:UIControlStateNormal];
    [blueButton setTitleColor:[UIColor colorWithWhite:1 alpha:0.5] forState:UIControlStateHighlighted];
    [blueButton setBackgroundColor:RGB(0, 182, 235)];
    [self.view addSubview:blueButton];
    
    yCoord += buttonHeight + margin + 15;
    
    UISegmentedControl *fruitChoicesControl = [[UISegmentedControl alloc] initWithItems:@[@"Apples", @"Oranges", @"Cherries"]];
    fruitChoicesControl.segmentedControlStyle = UISegmentedControlStyleBar;
    fruitChoicesControl.tintColor = [UIColor colorWithRed:0 green:182/255.0f blue:235/255.0f alpha:1];
    fruitChoicesControl.frame = CGRectMake(xCoord, yCoord, buttonWidth, fruitChoicesControl.frame.size.height);
    fruitChoicesControl.selectedSegmentIndex = 0;
    
    [self.view addSubview:fruitChoicesControl];
    self.fruitChoicesControl = fruitChoicesControl;
    
    yCoord += buttonHeight + margin - 15;
    
    UIButton *chooseFruitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [chooseFruitButton setFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
    [chooseFruitButton addTarget:self action:@selector(fruitButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [chooseFruitButton.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [chooseFruitButton setTitle:@"Choose Fruit" forState:UIControlStateNormal];
    [chooseFruitButton setTitleColor:[UIColor colorWithWhite:1 alpha:0.5] forState:UIControlStateHighlighted];
    [chooseFruitButton setBackgroundColor:[UIColor colorWithRed:0 green:182/255.0f blue:235/255.0f alpha:1]];
    [self.view addSubview:chooseFruitButton];
    
    yCoord += buttonHeight + margin + 10;
    
    UIButton *startTimedEventButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [startTimedEventButton setFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
    [startTimedEventButton addTarget:self action:@selector(startTimedEventButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [startTimedEventButton.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [startTimedEventButton setTitle:@"Start Timed Event" forState:UIControlStateNormal];
    [startTimedEventButton setTitleColor:[UIColor colorWithWhite:1 alpha:0.5] forState:UIControlStateHighlighted];
    [startTimedEventButton setBackgroundColor:[UIColor colorWithRed:0 green:182/255.0f blue:235/255.0f alpha:1]];
    [self.view addSubview:startTimedEventButton];
    
    yCoord += buttonHeight + margin;
    
    UIButton *stopTimedEventButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [stopTimedEventButton setFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
    [stopTimedEventButton addTarget:self action:@selector(stopTimedEventButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [stopTimedEventButton.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [stopTimedEventButton setTitle:@"Stop Timed Event" forState:UIControlStateNormal];
    [stopTimedEventButton setTitleColor:[UIColor colorWithWhite:1 alpha:0.5] forState:UIControlStateHighlighted];
    [stopTimedEventButton setBackgroundColor:[UIColor colorWithRed:0 green:182/255.0f blue:235/255.0f alpha:1]];
    [self.view addSubview:stopTimedEventButton];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [PWLogger log:@"Events Page View"];
    [PWAnalytics addEvent:@"Events Page View"];
}

#pragma mark - User Actions

- (void)redButtonTapped
{
    [PWLogger log:@"Red Button Pressed"];
    [PWAnalytics addEvent:@"Red Button Pressed"];
}

- (void)greenButtonTapped
{
    [PWLogger log:@"Green Button Pressed"];
    [PWAnalytics addEvent:@"Green Button Pressed"];
}

- (void)blueButtonTapped
{
    [PWLogger log:@"Blue Button Pressed"];
    [PWAnalytics addEvent:@"Blue Button Pressed"];
}

- (void)fruitButtonTapped
{
    NSString *selectedFruit = [self.fruitChoicesControl titleForSegmentAtIndex:self.fruitChoicesControl.selectedSegmentIndex];
    
    [PWLogger log:[NSString stringWithFormat:@"Fruit Button Pressed: %@", selectedFruit]];
    [PWAnalytics addEvent:@"Fruit Button Pressed"
             withParameters:@{@"fruit" : selectedFruit}];
}

- (void)startTimedEventButtonTapped
{
    [PWLogger log:@"START: Test Timed Event"];
    [PWAnalytics startTimedEvent:@"Test Timed Event"];
}

- (void)stopTimedEventButtonTapped
{
    [PWLogger log:@"END: Test Timed Event"];
    [PWAnalytics endTimedEvent:@"Test Timed Event"];
}

@end
