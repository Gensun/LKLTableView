//
//  LKLTableViewCellProtocol.h
//  LookingEdu
//
//  Created by Genie Sun on 2019/10/24.
//  Copyright © 2019 LookingEdu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LKLTableViewCellProtocol <NSObject>

@required
- (void)configureWithData:(id)data;

@end

NS_ASSUME_NONNULL_END
