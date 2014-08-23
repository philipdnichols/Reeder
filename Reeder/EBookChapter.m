#import "EBookChapter.h"
#import "EBookLog.h"
#import "EBook.h"

@interface EBookChapter ()

@end

@implementation EBookChapter

- (void)deleteWithSuccess:(void (^)())success failure:(void (^)(NSError *))failure
{
    [self.ebook removeChaptersObject:self];
    
    for (EBookLog *ebookLog in self.ebookLogs) {
        [ebookLog removeChaptersObject:self];
    }
    
    for (EBookLog *partialEBookLog in self.partialEbookLogs) {
        [partialEBookLog removeChaptersObject:self];
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
