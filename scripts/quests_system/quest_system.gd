extends Node

class_name QuestSystem

var quests = {}

func accept_quest(quest : Quest) -> bool:
	if (quests.has(quest)):
		return false
	else:
		quests.append(quest)
		quest.status = "Taken"
		return true

func loadQuest(questID : String) -> Quest:
	
	var json = JSON.new()
	var path : String = "res://quests/quest" + questID + ".json"
	var file = FileAccess.open(path, FileAccess.READ)
	var content = file.get_as_text()
	var quest = Quest.new()
	var data = json.parse_string(content)
		
	quest.requestor = data.get("Requestor")
	print(quest.requestor)
	quest.title = data.get("Title")
	print(quest.title)
	quest.description = data.get("Description")
	print(quest.description)
	quest.type = data.get("Type")
	print(quest.type)
	quest.fieldId = data.get("FieldID")
	print(quest.fieldId)
	quest.dialogNew = data.get("DialogNew")
	print(quest.dialogNew)
	quest.dialogTaken = data.get("DialogTaken")
	print(quest.dialogTaken)
	quest.dialogReady = data.get("DialogReady")
	print(quest.dialogReady)
	
	return quest
