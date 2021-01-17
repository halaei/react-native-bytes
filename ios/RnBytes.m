#import "RnBytes.h"


@implementation RnBytes

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(getFileLength:(NSString *)path
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
        NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:URL error:&attributesError];
        NSNumber *fileSize = [fileAttributes objectForKey:NSFileSize];
        resolve(fileSize);
    } @catch (NSException *exception) {
        reject(exception)
    }
}

RCT_EXPORT_METHOD(readFromAndWriteTo:(NSString *)sourcePath
                  targetPath(NSString *)targetPath
                  overwrite(BOOL)overwrite
                  append(BOOL)append
                  from(NSNumber *)from
                  to(NSNumber *)to
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    if (!overwrite || append) {
        reject(@"append not supported");
        return;
    }
    reject(@"todo");
}



@end
