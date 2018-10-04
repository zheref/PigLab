//
//  SidebarItemsDataStore.h
//  PigLab
//
//  Created by Sergio Lozano García on 10/3/18.
//  Copyright © 2018 Sergio Lozano García. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SidebarItemsDataStore : NSObject

+ (instancetype)sharedInstance;
- (NSArray*)retrieveList;

@end

NS_ASSUME_NONNULL_END
