extends Node

var mainMenu : Node
var gameInstance : Node
var minigameInstance : Node
var minigameEndScreen : Node

func LoadMainMenu():
	if mainMenu != null:
		mainMenu.queue_free()
	mainMenu = load("res://scenes/mainMenu.tscn").instantiate()
	add_child(mainMenu)
	remove_child(gameInstance)
func StartGame():
	loadParkScene()
	if(mainMenu != null):
		mainMenu.queue_free()
func StartShitMiniGame():
	if minigameInstance != null:
		minigameInstance.queue_free()
	unloadParkScene()
	minigameInstance = load("res://scenes/ShitMinigame.tscn").instantiate()
	get_parent().add_child(minigameInstance)
func StartSausageMiniGame():
	if minigameInstance != null:
		minigameInstance.queue_free()
	unloadParkScene()
	minigameInstance = load("res://scenes/GrillMiniagame.tscn").instantiate()
	get_parent().add_child(minigameInstance)
func unloadParkScene():
	gameInstance.get_parent().remove_child(gameInstance)
func loadParkScene():
	if gameInstance == null:
		gameInstance = load("res://scenes/ParkScene.tscn").instantiate()
	get_parent().add_child(gameInstance)
func ExitMinigame():
	if(minigameInstance != null):
		minigameInstance.queue_free()
	loadParkScene()
func ShowMingameEnd(IsWin):
	if minigameEndScreen != null:
		minigameEndScreen.queue_free()
	if minigameInstance != null:
		minigameInstance.queue_free()
	minigameEndScreen = load("res://scenes/MinigameEndScreen.tscn").instantiate()
	minigameEndScreen.IsWin = IsWin
	get_parent().add_child(minigameEndScreen)
func HideMinigameEndScreen():
	if minigameEndScreen != null:
		minigameEndScreen.queue_free()
	loadParkScene()
	
