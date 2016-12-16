//
//  Person.m
//  LearnObjC
//
//  Created by José Andy Quintero Melo on 15/12/2016.
//  Copyright © 2016 Nomasystems. All rights reserved.
//

#import "Person.h"

@implementation Person {
    // Private instance variables
}

-(id) initWithAll:(NSString *)firstname lastname:(NSString *)lastname
              age:(int) age {
    self = [super init];
    if (self){
        _firstname = firstname;
        _lastname = lastname;
        _age = age;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.firstname = [decoder decodeObjectForKey:@"firstname"];
        self.lastname = [decoder decodeObjectForKey:@"lastname"];
        self.age = [decoder decodeIntForKey:@"age"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_firstname forKey:@"firstname"];
    [encoder encodeObject:_lastname forKey:@"lastname"];
    [encoder encodeInt:_age forKey:@"age"];
}

@end
