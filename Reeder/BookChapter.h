#import "_BookChapter.h"

@interface BookChapter : _BookChapter

- (void)deleteWithSuccess:(void (^)())success failure:(void (^)(NSError *))failure;

@end
