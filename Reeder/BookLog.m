#import "BookLog.h"
#import "BookChapter.h"

@interface BookLog ()

@end

@implementation BookLog

- (void)deleteWithSuccess:(void (^)())success failure:(void (^)(NSError *))failure
{
    for (BookChapter *bookChapter in self.chapters) {
        [bookChapter removeBookLogsObject:self];
    }
    
    for (BookChapter *partialBookChapter in self.partialChapters) {
        [partialBookChapter removeBookLogsObject:self];
    }
    
    [super deleteWithSuccess:success failure:failure];
}

@end
