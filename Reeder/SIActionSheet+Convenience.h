//
//  SIActionSheet+Convenience.h
//  Reeder
//
//  Created by Philip Nichols on 8/22/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "SIActionSheet.h"

typedef void(^SIActionSheetHandlerBlock)(SIActionSheet *actionSheet);

@interface SIActionSheet (Convenience)

+ (instancetype)actionSheetWithTitle:(NSString *)title
                        buttonTitles:(NSArray *)buttonTitles
                  buttonHandlers:(NSDictionary *)buttonHandlers
                       cancelHandler:(SIActionSheetHandlerBlock)cancelHandler;

@end
