//
//  RLBaseDao+FirstPage.h
//  NetWorking
//
//  Created by 耿荣林 on 2018/5/28.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "RLBaseDao.h"

@interface RLBaseDao (FirstPage)
- (void)getVideoDataWithpageNum:(NSString *)number withuserId:(NSString *)userId withModelName:(NSString *)modelName;
@end
