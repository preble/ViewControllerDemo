//
//  PersonEditorViewController.h
//  ViewControllerDemo
//
//  Created by Adam Preble on 9/25/12.
//  Copyright (c) 2012 Adam Preble. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Person;

@interface PersonEditorViewController : NSViewController

@property (nonatomic, strong) Person *person;

@end

extern NSString * const PersonEditorViewControllerDidComplimentNotification;