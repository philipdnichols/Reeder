//
//  SIActionSheet+Convenience.m
//  Reeder
//
//  Created by Philip Nichols on 8/22/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "SIActionSheet+Convenience.h"

@implementation SIActionSheet (Convenience)

+ (instancetype)actionSheetWithTitle:(NSString *)title
                        buttonTitles:(NSArray *)buttonTitles
                      buttonHandlers:(NSDictionary *)buttonHandlers
                       cancelHandler:(SIActionSheetHandlerBlock)cancelHandler
{
    SIActionSheet *actionSheet = [[SIActionSheet alloc] initWithTitle:title];
    
    for (NSString *buttonTitle in buttonTitles) {
        [actionSheet addButtonWithTitle:buttonTitle
                                   type:SIActionSheetButtonTypeDefault
                                handler:buttonHandlers[buttonTitle]];
    }
    
    [actionSheet addButtonWithTitle:@"Cancel"
                               type:SIActionSheetButtonTypeCancel
                            handler:cancelHandler];
    
    return actionSheet;
}

@end
