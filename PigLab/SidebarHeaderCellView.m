//
//  SidebarHeaderCellView.m
//  PigLab
//
//  Created by Sergio Daniel L. García on 9/21/18.
//  Copyright © 2018 Sergio Lozano García. All rights reserved.
//

#import "SidebarHeaderCellView.h"

@interface SidebarHeaderCellView ()

@property (weak) IBOutlet NSTextField *contentTextField;
@property (weak) IBOutlet NSTextFieldCell *contentTextFieldCell;

@end

@implementation SidebarHeaderCellView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (void)configureTitle:(NSString *)title {
    [self.contentTextField setStringValue:title];
    [self.contentTextFieldCell setTitle:title];
}

@end
