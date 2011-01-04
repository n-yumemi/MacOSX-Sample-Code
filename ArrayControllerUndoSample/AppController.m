//
//  AppController.m
//  ArrayControllerUndoSample
//
//  Created by Hiroshi Hashiguchi on 10/12/27.
//  Copyright 2010 . All rights reserved.
//

#import "AppController.h"
#import "CustomArrayController.h"
#import "Book.h"

@implementation AppController

- (id) init
{
	self = [super init];
	if (self != nil) {
		array = [[NSMutableArray alloc] init];
		Book* book;
		int i;
		for (i=0; i < 10; i++) {
			book = [[[Book alloc] init] autorelease];
			book.title = [NSString stringWithFormat:@"TITLE-%02d", i];
			book.author = [NSString stringWithFormat:@"AUTHOR-%02d", i];
			[array addObject:book];
		}
		
	}
	return self;
}

- (void)awakeFromNib
{
		//	arrayController_.keys = [NSArray arrayWithObjects:@"title", @"author",nil];
}

- (IBAction)setSelection:(id)sender
{
	NSArray* arrangedObjects = [arrayController_ arrangedObjects];
	[arrayController_ setSelectedObjects:[NSArray arrayWithObjects:[arrangedObjects objectAtIndex:2], [arrangedObjects objectAtIndex:4], nil]];
}
- (IBAction)addSelection:(id)sender
{
	NSIndexSet* indexSet = [arrayController_ selectionIndexes];
	NSUInteger idx = [indexSet lastIndex]+1;
	NSArray* arrangedObjects = [arrayController_ arrangedObjects];
	[arrayController_ addSelectedObjects:[NSArray arrayWithObjects:[arrangedObjects objectAtIndex:idx], [arrangedObjects objectAtIndex:idx+1], nil]];
}

@end
