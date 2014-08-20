#import "_ReadingCollectionItem.h"

@interface ReadingCollectionItem : _ReadingCollectionItem

- (void)deleteWithSuccess:(void(^)())success failure:(void(^)(NSError *error))failure;

@end
