## usersテーブル	
|Column|Type|Options|	
|-------|----|-------|	
name|varchar|null: false, unique: true	
	
### Association	
-  has_many: groups, through: :members
-  has_many: members
-  has_many: messages
	
	
## membersテーブル	
|Column|Type|Options|	
|-------|----|-------|	
user_id|integer|null: false, references :user, foreign_key: true	
group_id|integer|null: false, references :group, foreign_key: true	
	
### Association	
- belongs_to: user
- belongs_to: group
	
	
## groupsテーブル	
|Column|Type|Options|	
|-------|----|-------|	
group_name|varchar|null: false, unique: true	
	
### Association	
-  has_many: users, through: :members
-  has_many: members
-  has_many: messages
	
	
## messagesテーブル	
|Column|Type|Options|	
|-------|----|-------|	
group_id|integer|null: false, references :group, foreign_key: true	
user_id|integer|null: false, references :user, foreign_key: true	
body|varchar|	
image|varchar|	
	
### Association	
-  belongs_to: user
-  belongs_to: group
