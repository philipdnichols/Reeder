#import "_EBookChapter.h"

@interface EBookChapter : _EBookChapter

- (void)deleteWithSuccess:(void (^)())success failure:(void (^)(NSError *))failure;

@end
