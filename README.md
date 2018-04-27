## usersテーブル	
|Column|Type|Options|	
|-------|----|-------|	
name|string|null: false, unique: true, add_index
	
### Association	
-  has_many: groups, through: :members
-  has_many: members
-  has_many: messages
	
	
## membersテーブル	
|Column|Type|Options|	
|-------|----|-------|	
user_id|references :user|null: false, foreign_key: true	
group_id|references :group|null: false, foreign_key: true	
	
### Association	
- belongs_to: user
- belongs_to: group
	
	
## groupsテーブル	
|Column|Type|Options|	
|-------|----|-------|	
group_name|string|null: false, unique: true	
	
### Association	
-  has_many: users, through: :members
-  has_many: members
-  has_many: messages
	
	
## messagesテーブル	
|Column|Type|Options|	
|-------|----|-------|	
group_id|references :group|null: false, foreign_key: true	
user_id|references :user|null: false, foreign_key: true	
body|string|	
image|string|	
	
### Association	
-  belongs_to: user
-  belongs_to: group
