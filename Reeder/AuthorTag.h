#import "_AuthorTag.h"

@interface AuthorTag : _AuthorTag {}

- (void)deleteWithSuccess:(void(^)())success failure:(void(^)(NSError *error))failure;

@end
