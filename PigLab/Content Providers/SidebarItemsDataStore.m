//
//  SidebarItemsDataStore.m
//  PigLab
//
//  Created by Sergio Lozano García on 10/3/18.
//  Copyright © 2018 Sergio Lozano García. All rights reserved.
//

#import "SidebarItemsDataStore.h"

@interface SidebarItemsDataStore()

@property (strong, nonatomic) NSArray *items;

@end

@implementation SidebarItemsDataStore

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (instancetype)sharedInstance
{
    return [[SidebarItemsDataStore alloc] init];
}

- (NSArray*)retrieveList
{
    NSString *sidebarItemsFileName = [[NSBundle mainBundle] pathForResource:@"SidebarItems" ofType:@"plist"];
    
    if (sidebarItemsFileName)
    {
        return [[NSArray alloc] initWithContentsOfFile:sidebarItemsFileName];
    } else {
        return [[NSArray alloc] init];
    }
}

@end
