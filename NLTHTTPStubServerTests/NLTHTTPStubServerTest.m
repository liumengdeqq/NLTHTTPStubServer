//
//  NLTHTTPStubServerTest.m
//  NLTHTTPStubServer
//
//  Created by  on 12/02/28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NLTHTTPStubServerTest.h"
#import "NLTHTTPStubServer.h"

@implementation NLTHTTPStubServerTest

- (void)tearDown {
    [NLTHTTPStubServer setCurrentStubServer:nil];
}


- (void)testCurrentStubServerAccessser {
    
    GHAssertNil([NLTHTTPStubServer currentStubServer], @"まだサーバーは作られていない");
    NLTHTTPStubServer *server1 = [NLTHTTPStubServer stubServer];
    [NLTHTTPStubServer setCurrentStubServer:server1];
    GHAssertEqualObjects(server1, [NLTHTTPStubServer currentStubServer], @"登録したはずのオブジェクトと一致しない");
    NLTHTTPStubServer *server2 = [NLTHTTPStubServer stubServer];
    [NLTHTTPStubServer setCurrentStubServer:server2];
    
    GHAssertEqualObjects(server2, [NLTHTTPStubServer currentStubServer], @"登録したはずのオブジェクトと一致しないまたは上書きされていない");
    GHAssertNotEqualObjects(server1, [NLTHTTPStubServer currentStubServer], @"以前のものが取得されている");
}

- (void)testStubGetter {
    NLTHTTPStubServer *getter = [NLTHTTPStubServer __stubGetter];
    GHAssertTrue([getter isKindOfClass:[NLTHCurrentStubGetter class]], @"このクラスは取得用のクラスじゃない");
}

@end