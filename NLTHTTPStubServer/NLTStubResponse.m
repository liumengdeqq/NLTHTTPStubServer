//
//  NLTStubResponse.m
//  NLTHTTPStubServer
//
//  Created by  on 12/03/08.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NLTStubResponse.h"
#import "NLTHTTPStubResponse.h"
#import "NLTHTTPDataStubResponse.h"

@implementation NLTStubResponse
+ (id)httpDataResponse {
    
    return [NLTHTTPDataStubResponse dataStubResponse];
}

+ (id)httpFileResponse {
    
    return [NLTHTTPStubResponse stubResponse];
}

@end
