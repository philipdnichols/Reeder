#import "_ReadingLogTag.h"

@interface ReadingLogTag : _ReadingLogTag

- (void)deleteWithSuccess:(void(^)())success failure:(void(^)(NSError *error))failure;

@end
