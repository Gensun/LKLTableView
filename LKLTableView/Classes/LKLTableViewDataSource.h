//
//  LKLTableViewDataSource.h
//  LookingEdu
//
//  Created by Genie Sun on 2019/10/24.
//  Copyright © 2019 LookingEdu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LKLTableViewSection,LKLTableViewRow;

NS_ASSUME_NONNULL_BEGIN

@interface LKLTableViewDataSource : NSObject <UITableViewDataSource>

/// configure tableview with  section
/// @param section single section
- (void)configureTableViewWithSection:(LKLTableViewSection *)section;

/// configure tableview with  sections
/// @param sections  sections
- (void)configureTableViewWithSections:(NSArray <LKLTableViewSection *> *)sections;

/// all sections
- (NSArray <LKLTableViewSection *> *)allSections;

/// number of sections in tableView
- (NSInteger)numberOfSections;

/// returns row according to the indexPath
/// @param indexPath indexPath
- (LKLTableViewRow *)rowAtIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
