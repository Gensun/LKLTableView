//
//  LKLTableViewRow.h
//  LookingEdu
//
//  Created by Genie Sun on 2019/10/24.
//  Copyright © 2019 LookingEdu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LKLTableViewRow;

typedef void (^DidSelectActionBlock)(LKLTableViewRow *_Nullable row, UITableView *_Nullable tableView, NSIndexPath *_Nullable indexPath);

NS_ASSUME_NONNULL_BEGIN

@interface LKLTableViewRow : NSObject

/// data model
@property (nonatomic, strong) id data;

/// Identifier
@property (nonatomic, strong) NSString *reuseIdentifier;

/// cell name
@property (nonatomic, strong) NSString *className;

/// cell height
@property (nonatomic, assign) CGFloat height;

/// cell selected
@property(nonatomic, copy) DidSelectActionBlock didSelect;

- (instancetype)initCellWithModel:(id)data
                   identifier:(NSString *)identifier
                       height:(CGFloat)height;
@end

NS_ASSUME_NONNULL_END
