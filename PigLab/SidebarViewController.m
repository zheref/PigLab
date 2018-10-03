//
//  SidebarViewController.m
//  PigLab
//
//  Created by Sergio Daniel L. García on 9/21/18.
//  Copyright © 2018 Sergio Lozano García. All rights reserved.
//

#import "SidebarViewController.h"

@interface SidebarViewController ()

@property (weak) IBOutlet NSOutlineView *sidebarOutlineView;
@property (strong, nonatomic) NSArray *items;

@end

@implementation SidebarViewController

NSString *const APPKIT_STR = @"AppKit";
NSString *const EXCEPTIONHANDLING_STR = @"ExceptionHandling";

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.items = [[NSArray alloc] initWithObjects:APPKIT_STR, EXCEPTIONHANDLING_STR, nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    [self.sidebarOutlineView setDataSource:self];
    [self.sidebarOutlineView setDelegate:self];
}

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item {
    if (item == nil) {
        return [self.items count];
    } else {
        return 0;
    }
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(nullable id)item {
    return (NSString *) [self.items objectAtIndex:index];
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
    return NO;
}
//
//- (NSView *)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item {
//
//}

@end
