//
//  EaseCallModal.m
//  EaseIM
//
//  Created by lixiaoming on 2021/1/8.
//  Copyright © 2021 lixiaoming. All rights reserved.
//

#import "AgoraChatCallModal.h"

@implementation AgoraChatCall

- (NSMutableDictionary*)allUserAccounts
{
    if(!_allUserAccounts) {
        _allUserAccounts = [NSMutableDictionary dictionary];
    }
    return _allUserAccounts;
}
@end

@interface AgoraChatCallModal ()
@property (nonatomic,weak) id<AgoraChatCallModalDelegate> delegate;
@end

@implementation AgoraChatCallModal
@synthesize state = _state;
- (instancetype)initWithDelegate:(id<AgoraChatCallModalDelegate>)delegate
{
    self = [super init];
    if(self) {
        self.delegate = delegate;
        self.currentCall = nil;
        self.hasJoinedChannel = NO;
        self.groupId = @"";
    }
    return self;
}
- (NSMutableDictionary*)recvCalls
{
    if(!_recvCalls) {
        _recvCalls = [NSMutableDictionary dictionary];
    }
    return _recvCalls;
}

- (NSString*)curDevId
{
    if([_curDevId length] == 0) {
        _curDevId = [NSString stringWithFormat:@"ios_%@", [[[UIDevice currentDevice] identifierForVendor] UUIDString] ];
    }
    return _curDevId;
}

- (void)setState:(AgoraChatCallState)state
{
    if (self.delegate && state != _state) {
        [self.delegate callStateWillChangeTo:state from:_state];
    }
    _state = state;
}

- (AgoraChatCallState)state
{
    return _state;
}
@end
