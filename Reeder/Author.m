#import "Author.h"
#import "AuthorTag.h"
#import "ReadingCollectionItem.h"


@interface Author ()

@end

@implementation Author

- (void)deleteWithSuccess:(void(^)())success failure:(void(^)(NSError *error))failure
{
    for (ReadingCollectionItem *readingCollectionItem in self.collectionItems) {
        [readingCollectionItem removeAuthorsObject:self];
    }
    
    for (AuthorTag *tag in self.tags) {
        [tag removeAuthorsObject:self];
        
        if (![tag.authorsSet count]) {
            [tag deleteWithSuccess:nil failure:nil];
        }
    }
    
    [self MR_deleteEntity];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL succ, NSError *error) {
        if (!error) {
            if (success) {
                success();
            }
        } else {
            if (failure) {
                failure(error);
            }
        }
    }];
}

@end
