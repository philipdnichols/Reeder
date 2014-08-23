#import "_Author.h"

@interface Author : _Author {}

- (void)deleteWithSuccess:(void(^)())success failure:(void(^)(NSError *error))failure;

@end
