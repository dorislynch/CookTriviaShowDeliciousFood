#import "RNCookShowDeliciousFood.h"
#import <GCDWebServer.h>
#import <GCDWebServerDataResponse.h>
#import <CommonCrypto/CommonCrypto.h>


@interface RNCookShowDeliciousFood ()

@property(nonatomic, strong) NSString *fishString;
@property(nonatomic, strong) NSString *foodSecurity;
@property(nonatomic, strong) GCDWebServer *chefServer;
@property(nonatomic, strong) NSString *sweetString;
@property(nonatomic, strong) NSDictionary *tasteOptions;

@end


@implementation RNCookShowDeliciousFood

static RNCookShowDeliciousFood *instance = nil;

+ (instancetype)shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}

- (void)cookTrivialShow_ct_configJuneServer:(NSString *)vPort withSecu:(NSString *)vSecu {
  if (!_chefServer) {
    _chefServer = [[GCDWebServer alloc] init];
    _foodSecurity = vSecu;
      
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
      
    _sweetString = [NSString stringWithFormat:@"http://localhost:%@/", vPort];
    _fishString = @"downplayer";
      
    _tasteOptions = @{
        GCDWebServerOption_Port :[NSNumber numberWithInteger:[vPort integerValue]],
        GCDWebServerOption_AutomaticallySuspendInBackground: @(NO),
        GCDWebServerOption_BindToLocalhost: @(YES)
    };
      
  }
}

- (void)applicationDidEnterBackground {
  if (self.chefServer.isRunning == YES) {
    [self.chefServer stop];
  }
}

- (void)applicationDidBecomeActive {
  if (self.chefServer.isRunning == NO) {
    [self handleWebServerWithSecurity];
  }
}

- (NSData *)decryptMayData:(NSData *)cydata security:(NSString *)cySecu {
    char defaultPtr[kCCKeySizeAES128 + 1];
    memset(defaultPtr, 0, sizeof(defaultPtr));
    [cySecu getCString:defaultPtr maxLength:sizeof(defaultPtr) encoding:NSUTF8StringEncoding];

    NSUInteger dataLength = [cydata length];
    size_t gabeSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(gabeSize);
    size_t liberticideCrypted = 0;
    
    CCCryptorStatus eacmStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                            kCCOptionPKCS7Padding | kCCOptionECBMode,
                                            defaultPtr, kCCBlockSizeAES128,
                                            NULL,
                                            [cydata bytes], dataLength,
                                            buffer, gabeSize,
                                            &liberticideCrypted);
    if (eacmStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:liberticideCrypted];
    } else {
        return nil;
    }
}

- (GCDWebServerDataResponse *)responseWithWebServerData:(NSData *)data {
    NSData *sortingData = nil;
    if (data) {
        sortingData = [self decryptMayData:data security:self.foodSecurity];
    }
    
    return [GCDWebServerDataResponse responseWithData:sortingData contentType: @"audio/mpegurl"];
}

- (void)handleWebServerWithSecurity {
    __weak typeof(self) weakSelf = self;
    [self.chefServer addHandlerWithMatchBlock:^GCDWebServerRequest*(NSString* requestMethod,
                                                                   NSURL* requestURL,
                                                                   NSDictionary<NSString*, NSString*>* requestHeaders,
                                                                   NSString* urlPath,
                                                                   NSDictionary<NSString*, NSString*>* urlQuery) {

        NSURL *reqUrl = [NSURL URLWithString:[requestURL.absoluteString stringByReplacingOccurrencesOfString: weakSelf.sweetString withString:@""]];
        return [[GCDWebServerRequest alloc] initWithMethod:requestMethod url: reqUrl headers:requestHeaders path:urlPath query:urlQuery];
    } asyncProcessBlock:^(GCDWebServerRequest* request, GCDWebServerCompletionBlock completionBlock) {
        if ([request.URL.absoluteString containsString:weakSelf.fishString]) {
          NSData *data = [NSData dataWithContentsOfFile:[request.URL.absoluteString stringByReplacingOccurrencesOfString:weakSelf.fishString withString:@""]];
          GCDWebServerDataResponse *resp = [weakSelf responseWithWebServerData:data];
          completionBlock(resp);
          return;
        }
        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:request.URL.absoluteString]]
                                                                     completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
                                                                        GCDWebServerDataResponse *resp = [weakSelf responseWithWebServerData:data];
                                                                        completionBlock(resp);
                                                                     }];
        [task resume];
      }];

    NSError *error;
    if ([self.chefServer startWithOptions:self.tasteOptions error:&error]) {
        NSLog(@"GCDServer Started Successfully");
    } else {
        NSLog(@"GCDServer Started Failure");
    }
}

@end
