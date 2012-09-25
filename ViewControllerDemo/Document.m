//
//  Document.m
//  ViewControllerDemo
//
//  Created by Adam Preble on 9/25/12.
//  Copyright (c) 2012 Adam Preble. All rights reserved.
//

#import "Document.h"
#import "PersonEditorViewController.h"
#import "Person.h"

@interface Document () {
	Person *person;
	PersonEditorViewController *personEditorViewController;
}

// The box is our placeholder for the PersonEditorViewController's view
@property IBOutlet NSBox *personEditorBox;

@end

@implementation Document

- (id)init
{
    self = [super init];
    if (self) {
		// Add your subclass-specific initialization here.
		person = [[Person alloc] init];
		[person setFirstName:@"Nerdy"];
		[person setLastName:@"Person"];
    }
    return self;
}

- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSString *)windowNibName
{
	// Override returning the nib file name of the document
	// If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
	return @"Document";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
	[super windowControllerDidLoadNib:aController];
	// Add any code here that needs to be executed once the windowController has loaded the document's window.

	personEditorViewController = [[PersonEditorViewController alloc] init];
	[personEditorViewController setPerson:person];
	
	// Observe the view controller for notifications of events taking place.
	// We could have created a delegate protocol, but notifications allow
	// multiple objects to observe changes (not necessary in this case).
	// Note that we do not establish a direct relationship from the view
	// controller to ourselves; this allows us to use the view controller
	// in various contexts (reusability).
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(notifyPersonEditorViewControllerDidCompliment:)
												 name:PersonEditorViewControllerDidComplimentNotification
											   object:personEditorViewController];

	// This adds the view controller's view to our document's window in the location
	// described by the box. The box is Custom with border disabled since we don't want
	// the user to know it's there.
	[[self personEditorBox] setContentView:[personEditorViewController view]];
}

#pragma mark - File Saving (Not Implemented)

+ (BOOL)autosavesInPlace
{
    return YES;
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
	// Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
	// You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
	NSException *exception = [NSException exceptionWithName:@"UnimplementedMethod" reason:[NSString stringWithFormat:@"%@ is unimplemented", NSStringFromSelector(_cmd)] userInfo:nil];
	@throw exception;
	return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
	// Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
	// You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
	// If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
	NSException *exception = [NSException exceptionWithName:@"UnimplementedMethod" reason:[NSString stringWithFormat:@"%@ is unimplemented", NSStringFromSelector(_cmd)] userInfo:nil];
	@throw exception;
	return YES;
}

#pragma mark - Notifications

- (void)notifyPersonEditorViewControllerDidCompliment:(NSNotification *)note // PersonEditorViewControllerDidComplimentNotification
{
	[[NSAlert alertWithMessageText:@"You look marvelous!"
					 defaultButton:@"Fair Enough"
				   alternateButton:nil
					   otherButton:nil
		 informativeTextWithFormat:@"This message intended for %@ %@.", [person firstName], [person lastName]] runModal];
}

@end
