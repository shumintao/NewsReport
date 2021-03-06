//
//  NRDBFriendSQL.h
//  NewsReport
//
//  Created by Facebook on 2018/2/7.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#ifndef NRDBFriendSQL_h
#define NRDBFriendSQL_h

#define     FRIENDS_TABLE_NAME              @"friends"

#define     SQL_CREATE_FRIENDS_TABLE        @"CREATE TABLE IF NOT EXISTS %@(\
uid TEXT,\
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
PRIMARY KEY(uid, fid))"

#define     SQL_UPDATE_FRIEND               @"REPLACE INTO %@ ( uid, fid, username, nikename, avatar, remark, ext1, ext2, ext3, ext4, ext5) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"

#define     SQL_SELECT_FRIENDS              @"SELECT * FROM %@ WHERE uid = %@"

#define     SQL_DELETE_FRIEND               @"DELETE FROM %@ WHERE uid = '%@' and fid = '%@'"

#endif /* NRDBFriendSQL_h */
