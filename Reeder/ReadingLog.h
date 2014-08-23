#import "_ReadingLog.h"

@interface ReadingLog : _ReadingLog

- (void)deleteWithSuccess:(void(^)())success failure:(void(^)(NSError *error))failure;

@end
