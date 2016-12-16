//
//  DBManager.h
//  LearnObjC
//
//  Created by José Andy Quintero Melo on 15/12/2016.
//  Copyright © 2016 Nomasystems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBManager : NSObject
{
    NSString *databasePath;
}

+(DBManager*)getSharedInstance;
-(BOOL) saveData:(NSString*)identifier name:(NSString*)name
      lastname:(NSString*)lastname age:(NSString*)age;
-(NSArray*) findByIdentifier:(NSString*)identifier;

@end
