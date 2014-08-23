#import "_ReadingCollectionItemTag.h"

@interface ReadingCollectionItemTag : _ReadingCollectionItemTag {}

- (void)deleteWithSuccess:(void(^)())success failure:(void(^)(NSError *error))failure;

@end
