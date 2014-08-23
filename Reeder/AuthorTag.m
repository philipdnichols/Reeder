#import "AuthorTag.h"
#import "Author.h"


@interface AuthorTag ()

@end


@implementation AuthorTag

- (void)deleteWithSuccess:(void(^)())success failure:(void(^)(NSError *error))failure
{
    for (Author *author in self.authorsSet) {
        [author removeTagsObject:self];
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
