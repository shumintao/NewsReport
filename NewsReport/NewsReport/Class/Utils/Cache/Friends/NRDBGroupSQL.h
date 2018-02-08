//
//  NRDBGroupSQL.h
//  NewsReport
//
//  Created by Facebook on 2018/2/7.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#ifndef NRDBGroupSQL_h
#define NRDBGroupSQL_h

#define     GROUPS_TABLE_NAME               @"groups"

#define     SQL_CREATE_GROUPS_TABLE         @"CREATE TABLE IF NOT EXISTS %@(\
uid TEXT,\
gid TEXT,\
name TEXT,\
ext1 TEXT,\
ext2 TEXT,\
ext3 TEXT,\
ext4 TEXT,\
ext5 TEXT,\
PRIMARY KEY(uid, gid))"

#define     SQL_UPDATE_GROUP                @"REPLACE INTO %@ ( uid, gid, name, ext1, ext2, ext3, ext4, ext5) VALUES ( ?, ?, ?, ?, ?, ?, ?, ? )"

#define     SQL_SELECT_GROUPS               @"SELECT * FROM %@ WHERE uid = %@"

#define     SQL_DELETE_GROUP                @"DELETE FROM %@ WHERE uid = '%@' and gid = '%@'"



#pragma mark - # GROUP MEMBERS
#define     GROUP_MEMBER_TABLE_NAMGE            @"group_members"

#define     SQL_CREATE_GROUP_MEMBERS_TABLE      @"CREATE TABLE IF NOT EXISTS %@(\
uid TEXT,\
gid TEXT,\
fid TEXT,\
username TEXT,\
nikename TEXT, \
avatar TEXT,\
remark TEXT,\
ext1 TEXT,\
ext2 TEXT,\
ext3 TEXT,\
ext4 TEXT,\
ext5 TEXT,\
PRIMARY KEY(uid, gid, fid))"

#define     SQL_UPDATE_GROUP_MEMBER             @"REPLACE INTO %@ ( uid, gid, fid, username, nikename, avatar, remark, ext1, ext2, ext3, ext4, ext5) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"

#define     SQL_SELECT_GROUP_MEMBERS            @"SELECT * FROM %@ WHERE uid = %@"

#define     SQL_DELETE_GROUP_MEMBER             @"DELETE FROM %@ WHERE uid = '%@' and gid = '%@' and fid = '%@'"


#endif /* NRDBGroupSQL_h */
