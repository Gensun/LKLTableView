//
//  UITableView+LKL.h
//  LookingEdu
//
//  Created by Genie Sun on 2019/10/24.
//  Copyright © 2019 LookingEdu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LKLTableViewSection, LKLTableViewRow;

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (LKL)

- (void)setupProtocol;

- (void)configureTableViewWithSection:(LKLTableViewSection *)section;
- (void)configureTableViewWithSections:(NSArray <LKLTableViewSection *> *)sections;
- (LKLTableViewRow *)rowAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
