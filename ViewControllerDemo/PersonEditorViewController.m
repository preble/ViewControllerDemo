//
//  PersonEditorViewController.m
//  ViewControllerDemo
//
//  Created by Adam Preble on 9/25/12.
//  Copyright (c) 2012 Adam Preble. All rights reserved.
//

#import "PersonEditorViewController.h"
#import "Person.h"

@interface PersonEditorViewController ()

@end

@implementation PersonEditorViewController

@synthesize person;

- (id)init
{
    self = [super initWithNibName:@"PersonEditorViewController" bundle:nil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (IBAction)compliment:(id)sender
{
	[[NSNotificationCenter defaultCenter] postNotificationName:PersonEditorViewControllerDidComplimentNotification object:self];
}

@end


NSString * const PersonEditorViewControllerDidComplimentNotification = @"PersonEditorViewControllerDidComplimentNotification";
