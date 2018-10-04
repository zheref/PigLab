//
//  SidebarViewController.m
//  PigLab
//
//  Created by Sergio Daniel L. García on 9/21/18.
//  Copyright © 2018 Sergio Lozano García. All rights reserved.
//

#import "SidebarViewController.h"
#import "SidebarDataCellView.h"
#import "SidebarHeaderCellView.h"
#import "Content Providers/SidebarItemsDataStore.h"

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
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    self.items = [[SidebarItemsDataStore sharedInstance] retrieveList];
    [self.sidebarOutlineView reloadData];
}

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item {
    if (item == nil) {
        return [self.items count];
    } else {
        NSDictionary *dict = (NSDictionary *)item;
        
        if (dict)
        {
            NSArray *topics = (NSArray *) [dict objectForKey:@"topics"];
            
            if (topics)
            {
                return [topics count];
            }
        }
    }
    
    return 0;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
    if (item == nil)
    {
        return [self.items count] > 0;
    }
    else
    {
        NSObject *obj = (NSObject *)item;
        
        if (!obj)
        {
            return NO;
        }
        
        if ([obj isKindOfClass:[NSString class]])
        {
            return NO;
        }
        
        NSDictionary *dict = (NSDictionary *)obj;
        
        if (dict) {
            NSArray *topics = (NSArray *) [dict objectForKey:@"topics"];
            
            if (topics)
            {
                return [topics count] > 0;
            }
        }
    }
    
    return NO;
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(nullable id)item {
    if (item == nil)
    {
        return (NSDictionary *)[self.items objectAtIndex:index];
    }
    else
    {
        NSDictionary *dict = (NSDictionary *)item;
        
        if (dict) {
            NSArray *topics = (NSArray *) [dict objectForKey:@"topics"];
            
            if (topics)
            {
                return [topics objectAtIndex:index];
            }
        }
    }
    
    return nil;
}

- (NSView *)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item
{
    NSView *view = nil;
    
    NSObject *obj = (NSObject *)item;
    
    if ([obj isKindOfClass:[NSString class]])
    {
        // It's a subtopic
        view = [outlineView makeViewWithIdentifier:@"DataCell" owner:self];
        
        if ([view isKindOfClass:[SidebarDataCellView class]])
        {
            SidebarDataCellView *castedView = (SidebarDataCellView *)view;
            [castedView configureTitle:(NSString *)item];
        }
    }
    else if ([obj isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *dict = (NSDictionary *)obj;
        
        NSArray *topics = (NSArray *) [dict objectForKey:@"topics"];
        
        if (topics)
        {
            view = [outlineView makeViewWithIdentifier:@"HeaderCell" owner:self];
            
            if ([view isKindOfClass:[SidebarHeaderCellView class]])
            {
                SidebarHeaderCellView *castedView = (SidebarHeaderCellView *)view;
                NSString *title = (NSString *)[dict objectForKey:@"name"];
                [castedView configureTitle:title];
            }
        }
    }
    
    return view;
}

@end
