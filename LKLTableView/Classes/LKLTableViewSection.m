//
//  LKLTableViewSection.m
//  LookingEdu
//
//  Created by Genie Sun on 2019/10/24.
//  Copyright © 2019 LookingEdu. All rights reserved.
//

#import "LKLTableViewSection.h"
#import "LKLTableViewRow.h"

@interface LKLTableViewSection ()

/// number of rows in section
@property (nonatomic, strong) NSMutableArray <LKLTableViewRow *> *rows;

@end

@implementation LKLTableViewSection

- (void)configureSectionWithRow:(LKLTableViewRow *)row {
    if (row == nil) return;

    [self.rows addObject:row];
}

- (void)configureSectionWithRows:(NSArray<LKLTableViewRow *> *)rows {
    if (rows == nil) return;

    if (rows.count == 1) {
        [self configureSectionWithRow:rows.firstObject];
        return;
    }
    [self.rows addObjectsFromArray:rows];
}

- (NSArray<LKLTableViewRow *> *)allRows {
    return self.rows;
}

- (NSInteger)numberOfRows {
    return self.rows.count;
}

- (LKLTableViewRow *)rowAtIndex:(NSInteger)index {
    if (self.rows.count <= index) {
        return nil;
    }

    return self.rows[index];
}

/// lazy init var
- (NSArray<LKLTableViewRow *> *)rows {
    if (_rows == nil) {
        _rows = [[NSMutableArray alloc] init];
    }
    return _rows;
}

@end
