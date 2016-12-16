//
//  Person.h
//  LearnObjC
//
//  Created by José Andy Quintero Melo on 15/12/2016.
//  Copyright © 2016 Nomasystems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCoding>{
    // Protected instance variables (not recommended)
}

@property NSString *firstname;
@property NSString *lastname;
@property int age;

-(id) initWithAll:(NSString *)firstname lastname:(NSString *)lastname
              age:(int) age;


@end
