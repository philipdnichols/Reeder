#import "_ReadingCollectionItem.h"

@interface ReadingCollectionItem : _ReadingCollectionItem

- (void)saveWithSuccess:(void(^)())success failure:(void(^)(NSError *error))failure;
- (void)deleteWithSuccess:(void(^)())success failure:(void(^)(NSError *error))failure;

@end
