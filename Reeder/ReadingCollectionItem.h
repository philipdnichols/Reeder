#import "_ReadingCollectionItem.h"

typedef NS_ENUM(NSUInteger, ReadingCollectionItemType) {
    ReadingCollectionItemTypeBook,
    ReadingCollectionItemTypeEBook
};

@interface ReadingCollectionItem : _ReadingCollectionItem

+ (NSArray *)typesAsTypes;
+ (NSArray *)typesAsStrings;
+ (NSString *)stringFromType:(ReadingCollectionItemType)type;
+ (NSString *)pluralStringFromType:(ReadingCollectionItemType)type;

@property (strong, nonatomic, readonly) NSString *formattedAuthors;
@property (strong, nonatomic, readonly) NSString *formattedTags;

- (void)saveWithSuccess:(void(^)())success failure:(void(^)(NSError *error))failure;
- (void)deleteWithSuccess:(void(^)())success failure:(void(^)(NSError *error))failure;

@end
