//
//  LKLTableViewSection.h
//  LookingEdu
//
//  Created by Genie Sun on 2019/10/24.
//  Copyright © 2019 LookingEdu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LKLTableViewRow;

NS_ASSUME_NONNULL_BEGIN

@interface LKLTableViewSection : NSObject

/// configure section with single row
/// @param row row
- (void)configureSectionWithRow:(LKLTableViewRow *)row;

/// configure section with  rows
/// @param rows rows
- (void)configureSectionWithRows:(NSArray<LKLTableViewRow *> *)rows;

/// all rows
- (NSArray<LKLTableViewRow *> *)allRows;

/// number of rows in section
- (NSInteger)numberOfRows;

/// returns row according to the index
/// @param index index
- (LKLTableViewRow *)rowAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
